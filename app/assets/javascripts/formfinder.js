/* global $ */
/* global jQuery */
/* global GOVUK */

$(document).ready(function () {
    // Turn off jQuery animation
    // Why is jQuery Animation on in the first place?
    jQuery.fx.off = true

    // Use GOV.UK selection-buttons.js to set selected
    // and focused states for block labels

    //
    var $blockLabels = $(".block-label input[type='radio'], .block-label input[type='checkbox']")
    new GOVUK.SelectionButtons($blockLabels) // eslint-disable-line

    // Where .block-label uses the data-target attribute
    // to toggle hidden content
    var showHideContent = new GOVUK.ShowHideContent()
    showHideContent.init()

    // Use GOV.UK shim-links-with-button-role.js to trigger a link styled to look like a button,
    // with role="button" when the space key is pressed.
    GOVUK.shimLinksWithButtonRole.init()

    // Details/summary polyfill
    // See /javascripts/vendor/details.polyfill.js

    // Accessible auto complete setup
    //Why use querySelector to lookup a specific element?
    // It can be up to 50% slower than geElmeentByID which
    // would return the same result
    // https://jsperf.com/getelementbyid-vs-queryselector

    var selectEl = document.querySelector('#document_list')
    var queryStringParameters = window.location.search
    var previouslySubmitted = queryStringParameters.length > 0

    accessibleAutocomplete.enhanceSelectElement({
        autoselect: true,
        defaultValue: '',
        minLength: 2,
        selectElement: selectEl
    })

    if (previouslySubmitted) {
        var submittedEl = document.querySelector('.submitted')
        submittedEl.classList.remove('submitted--hidden')
        var params = new URLSearchParams(document.location.search.split('?')[1])
        document.querySelector('.submitted__select-document').innerHTML = params.get('selected_document[]')
    }
})

//why is this .load and not .ready?
$(window).load(function () {

    //1. You should cache your selectors
    // eg, $errorSummary = $('.error-summary')
    // then use $errorSummary.length or $error summary etc

    //2. Where is this used?

    // Only set focus for the error example pages
    if ($('.js-error-example').length) {
        // If there is an error summary, set focus to the summary
        if ($('.error-summary').length) {
            $('.error-summary').focus()
            $('.error-summary a').click(function (e) {
                e.preventDefault()
                var href = $(this).attr('href')
                $(href).focus()
            })
        } else {
            // Otherwise, set focus to the field with the error
            $('.error input:first').focus()
        }
    }
})
