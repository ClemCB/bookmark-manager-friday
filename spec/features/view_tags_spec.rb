

feature 'I want to find links with specific tags' do

  scenario 'finds links which have the tag bubble' do

      user_adds_bookmark_with_tag
      click_button 'Add Bookmark'

      fill_in('title', with: "Bubbles")
      fill_in('url', with: "http://bubble.com")
      fill_in('tag', with: "bubbles")
      click_button 'Add Bookmark'

      visit '/tags/bubbles'
      expect(page).to have_content 'Bubbles'
      expect(page).not_to have_content 'Stackoverflow'
    end
  end
