package pages.modules

import geb.Module

class ReportSummaryLine extends Module {

    static content = {
        name { $('.report-name a span').text() }
        fromDate { $('.report-start').text() }
        toDate { $('.report-end').text() }
        editLink { $('td.report-actions [data-bind*=editUrl]')}
        submitButton { $('button[data-bind*="submitReport"]') }
        approveButton { $('button[data-bind*=approveReport]') }
        returnButton { $('button[data-bind*=rejectReport]') }
    }

    def printname() {
        println $('.report-name span')

        return true
    }

    def edit() {
        editLink.click()
    }

    def markedAsComplete() {
        $('.badge[data-bind*="finished"]').displayed
    }

    def canBeSubmitted() {
        submitButton.displayed
    }

    def isSubmitted() {
        $('[data-bind*="approvalTemplate"]').displayed
    }

    def isApproved() {
        def approvedBadge = $('.report-status .badge-success')
        approvedBadge.size() && approvedBadge.displayed && approvedBadge.text() == 'Report approved'

    }

    def submit() {
        submitButton.click()
    }

    def approve() {
        approveButton.click()
    }

    def returnReport() {
        returnButton.click()
    }
}
