//= require jquery
//= require jquery_ujs
//= require bootstrap/dist/js/bootstrap
//= require metisMenu/dist/metisMenu
//= require raphael/raphael
//= require morris.js/morris
//= require jquery.nicescroll
//= require tinymce/tinymce.min
//= require dropzone/dist/dropzone
//= require iCheck/icheck.min
//= require jquery_nested_form
//= require form_dropzone
//= require dashboard

function readURL(input){
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $(input).closest('.form-group').find('img').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}

$(function() {
  $(".preloader").fadeOut();
  $('#side-menu').metisMenu();
  $(".icheck").iCheck({
    checkboxClass: 'icheckbox_square-green',
    radioClass: 'iradio_square-green'});
  // Javascript to enable link to tab
  var hash = document.location.hash;
  if (hash) {
    $('.nav-tabs a[href="'+hash+'"]').tab('show');
  }
  // Change hash for page-reload
  $('.nav-tabs a').on('shown.bs.tab', function (e) {
    window.location.hash = e.target.hash;
  });

  $('body').change(".car_attachments_file input:file", function(event){
    readURL(event.target);
  });
});
