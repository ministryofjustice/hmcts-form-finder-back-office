$(document).ready(function () {

  // Use GOV.UK shim-links-with-button-role.js to trigger a link styled to look like a button,
  // with role="button" when the space key is pressed.
  GOVUK.shimLinksWithButtonRole.init();
  if ( document.getElementById('edit-document') || document.getElementById('new-document') ) {
    counter();
  }
  if ( document.getElementById('documents-index') || document.getElementById('link-documents') || document.getElementById('assign-categories')) {
    autocomplete();
    $('#auto-suggest-list').on('keyup', setSubmitButtonState);
  }
});
