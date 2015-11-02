<!-- ko stopBinding:true -->
<div id="blog"  data-bind="foreach:entries">
    <div class="blog-entry">
        <img class="blog-image floatleft" data-bind="attr:{src:imageUrl}">
        <div class="widget-news-right-body">
            <h3><span class="title" data-bind="text:title"></span><span class="floatright" data-bind="text:date"></span></h3>
            <div class="text" data-bind="text:text"></div> <i class="fa fa-arrow-circle-o-right"></i>
        </div>
    </div>

</div>
<!-- /ko -->
<r:script>
    $(function() {
        //var data = <fc:modelAsJavascript model="${[]}"/>;
        var data = [
            {title:'Test', text:'This is a test', date:'2 Oct', imageUrl:'http://ecodata.ala.org.au/uploads/2015-08/Common%20Riverbank%20Weeds%20Cover%20Image.png'},
            {title:'Also a test', text:'Over four years of Caring for our Country funding the RLF has run a dedicated program of events targeting horse owners. From early workshops using the "Managing Horses on Small Properties" workshop series offered by Equiculture it became apparent that a network of horse owners interested in sustainable land management would be valuable. ', date:'12 Sep', imageUrl:'http://ecodata.ala.org.au/uploads/2015-08/Common%20Riverbank%20Weeds%20Cover%20Image.png'}
        ];
        var blog = new BlogViewModel(data);
        ko.applyBindings(blog, document.getElementById('blog'));
    });
</r:script>
