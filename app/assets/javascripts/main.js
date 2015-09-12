$(function() {
  // hide modals on success
  $.fn.modal_success = function(){
      this.modal('hide');
  };

  // if a modal has an autofocus element, focus it on show
  $('.modal').on('shown.bs.modal', function() {
    $(this).find('[autofocus]').focus();
  });

  // reset a modal's form once it's closed
  $('.modal').on('hidden.bs.modal', function() {
    $(this).find('form')[0].reset();
  });

  // hide modals on ajax complete
  $("form").on("ajax:complete submit", function(event, xhr, status, error) {
    if ($(this).closest("div.modal").length) {
      $(this).closest("div.modal").modal("hide");
    }
  });

  // bootstrap-ify tooltips
  $('body').tooltip({selector: '[data-toggle=tooltip]'});
});
