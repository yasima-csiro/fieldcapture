/*
Handles the display and editing of UTC dates.

Declares a Knockout extender that allows UTC ISODates to be displayed and edited as simple dates in the form
 dd-MM-yyyy and with local timezone adjustment. Hours and minutes can optionally be shown and edited.

Declares a custom binding that allows dates to be changed using the Bootstrap datepicker
 (https://github.com/eternicode/bootstrap-datepicker).

The date values in the ViewModel are maintained as UTC dates as strings in ISO format (ISO8601 without milliseconds).

The extender adds a 'formattedDate' property to the observable. It is this property that should be bound
 to an element, eg

    <input data-bind="value: myDate.formattedDate" type=...../> or
    <span data-bind="text: myDate.formattedDate" />

The date is defined in the view model like this:

    self.myDate = ko.observable("${myDate}").extend({simpleDate: false});

The boolean indicates whether to show the time as well.

The extender also adds a 'date' property to the observable that holds the value as a Javascript date object.
This is used by the datepicker custom binding.

The custom binding listens for changes via the datepicker as well as direct edits to the input field and
 updates the model. It also updates the datepicker on change to the model.

*/

(function(){

    // creates an ISO8601 date string but without millis - to match the format used by the java thingy for BSON dates
    Date.prototype.toISOStringNoMillis = function() {
        function pad(n) { return n < 10 ? '0' + n : n }
        return this.getUTCFullYear() + '-'
            + pad(this.getUTCMonth() + 1) + '-'
            + pad(this.getUTCDate()) + 'T'
            + pad(this.getUTCHours()) + ':'
            + pad(this.getUTCMinutes()) + ':'
            + pad(this.getUTCSeconds()) + 'Z';
    };

    // Use native IDO date parsing or shim for old browsers (IE8)
    var D= new Date('2011-06-02T09:34:29+02:00');
    if(!D || +D!== 1307000069000){
        Date.fromISO= function(s){
            var day, tz,
                rx=/^(\d{4}\-\d\d\-\d\d([tT ][\d:\.]*)?)([zZ]|([+\-])(\d\d):(\d\d))?$/,
                p= rx.exec(s) || [];
            if(p[1]){
                day= p[1].split(/\D/);
                for(var i= 0, L= day.length; i<L; i++){
                    day[i]= parseInt(day[i], 10) || 0;
                }
                day[1]-= 1;
                day= new Date(Date.UTC.apply(Date, day));
                if(!day.getDate()) return NaN;
                if(p[5]){
                    tz= (parseInt(p[5], 10)*60);
                    if(p[6]) tz+= parseInt(p[6], 10);
                    if(p[4]== '+') tz*= -1;
                    if(tz) day.setUTCMinutes(day.getUTCMinutes()+ tz);
                }
                return day;
            }
            return NaN;
        }
    }
    else{
        Date.fromISO= function(s){
            return new Date(s);
        }
    }
})();

function convertToSimpleDate(isoDate, includeTime) {
    if (!isoDate) { return ''}
    var date = isoDate, strDate;
    if (typeof isoDate === 'string') {
        date = Date.fromISO(isoDate);
    }
    strDate = pad(date.getDate(),2) + '-' + pad(date.getMonth() + 1,2) + '-' + date.getFullYear();
    if (includeTime) {
        strDate = strDate + ' ' + pad(date.getHours(),2) + ':' + pad(date.getMinutes(),2);
    }
    return strDate;
}

function convertToIsoDate(date) {
    if (typeof date === 'string') {
        if (date.length === 20 && date.charAt(19) === 'Z') {
            // already an ISO date string
            return date;
        } else if (date.length > 9){
            // assume a short date of the form dd-mm-yyyy
            var year = date.substr(6,4),
                month = Number(date.substr(3,2))- 1,
                day = date.substr(0,2),
                hours = date.length > 12 ? date.substr(11,2) : 0,
                minutes = date.length > 15 ? date.substr(14,2) : 0;
            return new Date(year, month, day, hours, minutes).toISOStringNoMillis();
        } else {
            return '';
        }
    } else if (typeof date === 'object') {
        // assume a date object
        return date.toISOStringNoMillis();
    } else {
        return '';
    }
}

function stringToDate(date) {
    if (typeof date === 'string') {
        if (date.length === 20 && date.charAt(19) === 'Z') {
            // already an ISO date string
            return Date.fromISO(date);
        } else if (date.length > 9){
            // assume a short date of the form dd-mm-yyyy
            var year = date.substr(6,4),
                month = Number(date.substr(3,2))- 1,
                day = date.substr(0,2),
                hours = date.length > 12 ? date.substr(11,2) : 0,
                minutes = date.length > 15 ? date.substr(14,2) : 0;
            return new Date(year, month, day, hours, minutes);
        } else {
            return undefined;
        }
    } else if (typeof date === 'object') {
        // assume a date object
        return date;
    } else {
        return undefined;
    }
}

(function() {
    ko.extenders.simpleDate = function (target, includeTime) {
        target.date = ko.computed({
            read: function () {
                return Date.fromISO(target());
            },

            write: function (newValue) {
                if (newValue) {
                    var current = target(),
                        valueToWrite = convertToIsoDate(newValue);

                    if (valueToWrite !== current) {
                        target(valueToWrite);
                    }
                } else {
                    // date has been cleared
                    target("");
                }
            }
        });
        target.formattedDate = ko.computed({
            read: function () {
                return convertToSimpleDate(target(), includeTime);
            },

            write: function (newValue) {
                if (newValue) {
                    var current = target(),
                        valueToWrite = convertToIsoDate(newValue);

                    if (valueToWrite !== current) {
                        target(valueToWrite);
                    }
                }
            }
        });

        target.date(target());
        target.formattedDate(target());

        return target;
    };

    /* Custom binding for Bootstrap datepicker */
    ko.bindingHandlers.datepicker = {
        init: function(element, valueAccessor, allBindingsAccessor) {
            //initialize datepicker with some optional options
            $(element).datepicker({format: 'dd-mm-yyyy', autoclose: true});

            // if the parent container holds any element with the class 'open-datepicker'
            // then add a hook to do so
            $(element).parent().find('.open-datepicker').click(function () {
                $(element).datepicker('show');
            });

            //when a user changes the date via the datepicker, update the view model
            ko.utils.registerEventHandler(element, "changeDate", function(event) {
                var value = valueAccessor();
                if (ko.isObservable(value)) {
                    value(event.date);
                }
            });

            //when a user changes the date via the input, update the view model
            ko.utils.registerEventHandler(element, "change", function() {
                var value = valueAccessor();
                if (ko.isObservable(value)) {
                    value(stringToDate(element.value));
                }
            });
        },
        update: function(element, valueAccessor)   {
            var widget = $(element).data("datepicker");
            //when the view model is updated, update the widget
            if (widget) {
                widget.date = ko.utils.unwrapObservable(valueAccessor());
                if (!isNaN(widget.date)) {
                    widget.setDate( widget.date);
                }
            }
        }
    };

}());

function pad(number, length){
    var str = "" + number
    while (str.length < length) {
        str = '0'+str
    }
    return str
}

//wrapper for an observable that protects value until committed
ko.protectedObservable = function(initialValue) {
    //private variables
    var _temp = initialValue;
    var _actual = ko.observable(initialValue);

    var result = ko.dependentObservable({
        read: _actual,
        write: function(newValue) {
            _temp = newValue;
        }
    });

    //commit the temporary value to our observable, if it is different
    result.commit = function() {
        if (_temp !== _actual()) {
            _actual(_temp);
        }
    };

    //notify subscribers to update their value with the original
    result.reset = function() {
        _actual.valueHasMutated();
        _temp = _actual();
    };

    return result;
};
