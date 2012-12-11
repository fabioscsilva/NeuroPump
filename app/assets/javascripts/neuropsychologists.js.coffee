# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
<<<<<<< HEAD
        $('#neuropsychologist').dataTable
=======
        $('#neuropsychologist').dataTable
            "sDom": "<'row-fluid'<'form-actions'f>rtp>"
            "bInfo": false
            "bLengthChange": false
            "sPaginationType": "bootstrap"
            "iDisplayLength": 3
            "aoColumnDefs": [
                        { "bSearchable": false, "aTargets": [ 2 ] }
                        { "bSortable"  : false, "aTargets": [ 2 ] }
             ]
>>>>>>> feature_listar_pacientes
