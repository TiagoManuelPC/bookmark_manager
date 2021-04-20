require_relative "./web_helper.rb"

feature 'testing adding a new bookmark' do
  scenario 'Add a new bookmark and expect our bookmarks page to update' do
    visit('/')
    fill_in('add_bookmark', with: 'www.amazon.co.uk')
    click_button('Add')
    click_button("View Bookmarks")
    expect(page).to have_content('www.amazon.co.uk')
  end
end