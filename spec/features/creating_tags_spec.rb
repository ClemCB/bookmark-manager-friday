# As a time-pressed user
# So that I can organise my many links into different categories for ease of search
# I would like to tag links in my bookmark manager

feature 'add tag' do
  scenario 'add a tag to a link when created' do
    user_adds_bookmark_with_tag
    click_button 'Add Bookmark'
    expect(page).to have_content 'Tech'
  end
end
