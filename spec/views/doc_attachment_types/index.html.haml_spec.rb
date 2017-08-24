require 'rails_helper'

RSpec.describe 'doc_attachment_types/index', type: :view do
  before(:each) do
    assign(:active_doc_attachment_types, [
             DocAttachmentType.create!(
               english_name: 'English Name',
               welsh_name: 'Welsh Name'
             ),
             DocAttachmentType.create!(
               english_name: 'English Name1',
               welsh_name: 'Welsh Name1'
             )
           ])
    assign(:inactive_doc_attachment_types, [
             DocAttachmentType.create!(
               english_name: 'English Name2',
               welsh_name: 'Welsh Name2'
             ),
             DocAttachmentType.create!(
               english_name: 'English Name3',
               welsh_name: 'Welsh Name3'
             )
           ])
  end

  it 'renders a list of doc_attachment_types' do
    render
    assert_select 'tr>td', text: 'English Name'.to_s, count: 4
    assert_select 'tr>td', text: 'Welsh Name'.to_s, count: 4
  end
end
