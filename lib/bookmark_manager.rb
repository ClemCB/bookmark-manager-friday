require './lib/db_helper'

class BookmarkManager
  include DBHelper

  def show_bookmarks
    list_bookmarks
  end

  def show_links
    list_links
  end

  def add_link(params)
    insert_into_db(params)
  end

  def show_tags
    list_tags
  end

end
