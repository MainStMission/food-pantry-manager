
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.


 //= require jquery
 //= require jquery_ujs
 //= require bootstrap
 //= require dataTables/jquery.dataTables
 //= require dataTables/jquery.dataTables.bootstrap
 //= require cocoon
 //= require jquery-ui
 //= require header
 //= require_tree .






$(document).ready(function(){
    $('#households').dataTable({
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    "sPaginationType": "bootstrap", process:  "bProcessing", paginate: "bPaginate",
    autowidth: "bAutoWidth", defer_render: "bDeferRender",
    destroy: "bDestroy", filter: "bFilter", info: "bInfo",
    length_change: "bLengthChange", retrieve: "bRetrieve",
    scroll_collapse: "bScrollCollapse", scroll_infinite: "bScrollInfinite",
    searchable: "bSearchable", server_side: "bServerSide",
    sort: "bSort", sortable: "bSortable", sort_cells_top: "bSortCellsTop",
    sort_classes: "bSortClasses", state_save: "bStateSave",
    use_rendered: "bUseRendered", visible: "bVisible"
})
});



$.extend( $.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline"
} );

