$(document).ready(function () {

    // Where .block-label uses the data-target attribute
    // to toggle hidden content
    var showHideContent = new GOVUK.ShowHideContent()
    showHideContent.init()

    // Use GOV.UK shim-links-with-button-role.js to trigger a link styled to look like a button,
    // with role="button" when the space key is pressed.
    GOVUK.shimLinksWithButtonRole.init()

    // Summary character counter setup
    $('.counter').characterCounter({
        postCountMessage: "characters left",
        postCountMessageSingular: "character left",
        zeroRemainingMessage: "No characters left",
        overrunPreCountMessage: "Please remove",
        overrunPostCountMessage: "characters",
        overrunPostCountMessageSingular: "character",
        positiveOverruns: true
    });

    // Accessible auto complete setup
    var selectEl = document.querySelector('.auto-suggest-list');
    var queryStringParameters = window.location.search;
    var previouslySubmitted = queryStringParameters.length > 0;

    accessibleAutocomplete.enhanceSelectElement({
        autoselect: true,
        defaultValue: '',
        minLength: 2,
        selectElement: selectEl
    });

    if (previouslySubmitted) {
        var submittedEl = document.querySelector('.submitted')
        submittedEl.classList.remove('submitted--hidden')
        var params = new URLSearchParams(document.location.search.split('?')[1])
        document.querySelector('.submitted__select-document').innerHTML = params.get('selected_document[]')
    }

})

// $(window).load(function () {
//     // Only set focus for the error example pages
//     if ($('.js-error-example').length) {
//         // If there is an error summary, set focus to the summary
//         if ($('.error-summary').length) {
//             $('.error-summary').focus()
//             $('.error-summary a').click(function (e) {
//                 e.preventDefault()
//                 var href = $(this).attr('href')
//                 $(href).focus()
//             })
//         } else {
//             // Otherwise, set focus to the field with the error
//             $('.error input:first').focus()
//         }
//     }
// })
