module PageObjects
  module Sections
    class AutoCompleteSection < SitePrism::Section
      element :autocomplete_field, 'input[type="text"]#auto-suggest-list'
      element :autocomplete_list, 'ul#auto-suggest-list__listbox'
      element :autocomplete_select, 'select#auto-suggest-list-select'
    end
  end
end
