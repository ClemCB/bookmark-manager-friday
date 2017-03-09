module DBHelper

  def get_all_links
    Link.all
  end

  def list_links
    link_array = []
    get_all_links.each { |link| link_array << link_formatter(link) }
    link_array
  end

  def link_formatter(link)
    {title: link.title, url: link.url}
  end

  def get_all_tags
    Tag.all
  end

  def list_tags
    tag_array = []
    get_all_tags.each { |tag| tag_array << tag_formatter(tag) }
    tag_array
  end

  def tag_formatter(tag)
    {name: tag.name}
  end

  def insert_into_db(params)
    LinkTag.create(:link => Link.create(:title => params[:title], :url => params[:url]), :tag => Tag.first_or_create(:name => (params[:tag].capitalize)))
  end

end
