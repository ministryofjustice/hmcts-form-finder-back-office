require 'rails_helper'

feature 'Admin user should be able to search for documents' do
  let!(:user) { create :user }

  background do
    login_as(user, scope: :user)
  end

  it 'categories search works with a query' do
    category = create :category
    visit link_document_categories_search_path
    fill_in :search, with: category.english_name
    click_on 'Search'
    expect(page).to have_content # {category.english_name}
  end
end
