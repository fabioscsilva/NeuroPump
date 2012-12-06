# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
        $('#secretary').dataTable
            "sDom": "<'row-fluid'<'form-actions'>rtp>"
            "bInfo": false
            "bLengthChange": false
            "sPaginationType": "bootstrap"
            "iDisplayLength": 10
            "aoColumnDefs": [
                        { "bSearchable": false, "aTargets": [ 1 ] }
             ]