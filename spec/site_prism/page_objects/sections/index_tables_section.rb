module PageObjects
  module Sections
    class IndexTablesSection < SitePrism::Section
      elements :all_active_rows, '#active_list tbody tr.item'
      element :active_action,      'td.action'
      element :active_code,        'td.code'
      element :active_email,       'td.email'
      element :active_english,     'td.english'
      element :active_name,        'td.name'
      element :active_welsh,       'td.welsh'

      elements :all_active_rows, '#inactive_list tbody tr.item'
      element :inactive_action,    'td.action'
      element :inactive_code,      'td.code'
      element :inactive_email,     'td.email'
      element :inactive_english,   'td.english'
      element :inactive_name,      'td.name'
      element :inactive_welsh,     'td.welsh'
    end
  end
end
