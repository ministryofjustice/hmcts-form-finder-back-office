// Accessible auto complete setup
var autocomplete = function(){
  accessibleAutocomplete.enhanceSelectElement({
    autoselect: true,
    defaultValue: '',
    minLength: 2,
    selectElement: document.getElementById('auto-suggest-list')
  });
  $('.auto-suggest').prop('disabled', true);
};

// Summary character counter setup
var counter = function() {
  var $formElement = $('.counter');
  $formElement.characterCounter({
    postCountMessage: "characters left",
    postCountMessageSingular: "character left",
    zeroRemainingMessage: "No characters left",
    overrunPreCountMessage: "Please remove",
    overrunPostCountMessage: "characters",
    overrunPostCountMessageSingular: "character",
    positiveOverruns: true
  });
};

var setNavigationHighlight = function(){
    var pageTitle = $(".main-header h1").text().trim();
    if (/document/i.test(pageTitle)) { $(".global-nav a:contains('Document')").addClass('active'); }
    else if (/Categor/i.test(pageTitle)) { $(".global-nav a:contains('Categor')").addClass('active'); }
    else if (/Language/i.test(pageTitle)) { $(".global-nav a:contains('Language')").addClass('active'); }
    else if (/Type/i.test(pageTitle)) { $(".global-nav a:contains('Type')").addClass('active') }
    else if (/edirect/i.test(pageTitle)) { $(".global-nav a:contains('edirect')").addClass('active') }
    else { $(".global-nav a:contains('User accounts')").addClass('active'); }
};

var setSubmitButtonState = function(){
  if ( ($('ul#auto-suggest-list__listbox li').length > 0 ) && ($('ul#auto-suggest-list__listbox li:first').text()) !== "No results found" ) {
    $('.auto-suggest').prop('disabled', false);
  }
  else {
    $('.auto-suggest').prop('disabled', true);
  }
};

$(document).ready(function () {

  setNavigationHighlight();

  // Where .block-label uses the data-target attribute
  // to toggle hidden content
  var showHideContent = new GOVUK.ShowHideContent();
  showHideContent.init();

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
