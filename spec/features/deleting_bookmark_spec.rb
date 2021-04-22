require_relative './web_helper'

feature 'testing deleting a new bookmark' do
  scenario 'delete a bookmark and expect our bookmarks page to update' do
    visit('/')
    fill_in('add_bookmark', with: 'www.amazon.co.uk')
    fill_in('add_name', with: 'Amazon')
    click_button('Add')
    click_button('View Bookmarks')
    click_button('Delete')
    expect(page).not_to have_content('Amazon')
  end
end