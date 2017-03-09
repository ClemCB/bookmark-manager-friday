feature 'create a new link' do
  scenario 'adds a link title and url' do
    user_adds_bookmark
    click_button 'Add Bookmark'
    expect(page).to have_content 'Stackoverflow'
  end
end
