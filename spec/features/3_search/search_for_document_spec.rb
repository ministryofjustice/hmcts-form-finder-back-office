require 'rails_helper'

feature "Admin user should be able to search for documents" do

  let!(:user) { create :user }


  background do
    login_as(user, :scope => :user)
  end


  it "documents search works with a query" do
    document = create :document
    visit link_documents_search_path
    fill_in :search, with: document.code
    click_on 'Search'
    expect(page).to have_content #{document.title}
    expect(page).to have_content #{document.code}
  end
end
