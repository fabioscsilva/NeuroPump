# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
        $('#clinics').dataTable
            "sDom": "<'row-fluid'<'form-actions'f>rtp>"
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
            "aaSorting": [[4, "asc"], [0, "asc"]]
            "iDisplayLength": 5
            "aoColumnDefs": [
                        { "bSearchable": false, "aTargets": [ 3 ] }
                        { "bSortable"  : false, "aTargets": [ 1,3 ] }
                        ]
jQuery ->
  $('#clinic-payments').dataTable
            "sDom": "<'row-fluid'rtp>"
            "bInfo": false
            "bLengthChange": false
            "oLanguage":
                        {
                          "sZeroRecords": "Não foram encontrados resultados."
                          "sSearch": "Procurar:"
                          "oPaginate":
                                      {
                                        "sNext":"Próximo"
                                        "sPrevious":"Anterior"
                                      }                                                                             
                        }
            "sPaginationType": "bootstrap"
            "aaSorting": []
            "iDisplayLength": 10
