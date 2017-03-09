require './lib/db_helper'

class BookmarkManager
  include DBHelper

  def show_links
    links_list
  end

  def add_link(params)
    insert_into_db(params)
  end

end
