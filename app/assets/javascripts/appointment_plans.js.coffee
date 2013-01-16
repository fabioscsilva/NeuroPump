# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
        $('#appointment_plan').dataTable
            "sDom": "<'row-fluid'<'form-actions'>rtp>"
            "bInfo": false
            "bLengthChange": false
            "oLanguage":
                        {
                          "sZeroRecords":"Não foram encontrados resultados."
                          "sSearch":"Procurar:"
                          "oPaginate":
                                      {
                                        "sNext":"Próximo"
                                        "sPrevious":"Anterior"
                                      }
                        }          
            "sPaginationType": "bootstrap"
            "iDisplayLength": 5
            "aoColumnDefs": [
                        { "bSortable"  : false, "aTargets": [ 0 ] }
            ]