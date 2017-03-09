def user_adds_bookmark
  visit '/'
  fill_in('title', with: "Stackoverflow")
  fill_in('url', with: "http://stackoverflow.com")
end

def user_adds_bookmark_with_tag
  user_adds_bookmark
  fill_in('tag', with: "tech")
end
