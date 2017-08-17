// Summary character counter setup
var counter = function() {
    var $formElement = $('.counter')
        $formElement.characterCounter({
        postCountMessage: "characters left",
        postCountMessageSingular: "character left",
        zeroRemainingMessage: "No characters left",
        overrunPreCountMessage: "Please remove",
        overrunPostCountMessage: "characters",
        overrunPostCountMessageSingular: "character",
        positiveOverruns: true
    });
}

// Accessible auto complete setup
var autoSuggest = function(){

    var $selectEl = document.getElementById('auto-suggest-list');
    var $queryStringParameters = window.location.search;
    var $previouslySubmitted = $queryStringParameters.length > 0;

    accessibleAutocomplete.enhanceSelectElement({
        autoselect: true,
        defaultValue: '',
        minLength: 2,
        selectElement: $selectEl
    });

    if ($previouslySubmitted) {
        var $submittedEl = document.getElementsByClassName('.submitted')
        $submittedEl.classList.remove('submitted--hidden')
        var $params = new URLSearchParams(document.location.search.split('?')[1])
        document.getElementsByClassName('.submitted__select-document').innerHTML = $params.get('selected_document[]')
    }
}

$(document).ready(function () {

    // Where .block-label uses the data-target attribute
    // to toggle hidden content
    var showHideContent = new GOVUK.ShowHideContent()
    showHideContent.init()

    // Use GOV.UK shim-links-with-button-role.js to trigger a link styled to look like a button,
    // with role="button" when the space key is pressed.
    GOVUK.shimLinksWithButtonRole.init()

    counter();
    autoSuggest();

})
