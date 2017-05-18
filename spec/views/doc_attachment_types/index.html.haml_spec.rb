require 'rails_helper'

RSpec.describe 'doc_attachment_types/index', type: :view do
  before(:each) do
    assign(:doc_attachment_types, [
             DocAttachmentType.create!(
               english_name: 'English Name',
               welsh_name: 'Welsh Name'
             ),
             DocAttachmentType.create!(
               english_name: 'English Name',
               welsh_name: 'Welsh Name'
             )
           ])
  end

  it 'renders a list of doc_attachment_types' do
    render
    assert_select 'tr>td', text: 'English Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Welsh Name'.to_s, count: 2
  end
end
