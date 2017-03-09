require 'bookmark_manager'

describe BookmarkManager do

  before(:each) do
    LinkTag.create(:link => Link.create(:title => "Example Page", :url => "http://example.com"), :tag => Tag.first_or_create(:name => "Favourites"))
  end

  describe '#get_all_links' do
    it 'should get the database collection of links' do
      expect(subject.get_all_links).to be_an_instance_of DataMapper::Collection
    end
  end

  describe '#list_links' do
    it 'should list out all the links' do
      expect(subject.list_links).to be_an_instance_of Array
      expect(subject.list_links[0][:title]).to eql "Example Page"
    end
  end

  describe '#link_formatter' do
    it 'should convert a Link in to a Hash' do
      link = subject.get_all_links[0]
      expect(subject.link_formatter(link)).to be_an_instance_of Hash
    end
  end

  describe '#show_links' do
    it 'should show all the links' do
      expect(subject.show_links).to be_an_instance_of Array
      expect(subject.show_links[0]).to be_an_instance_of Hash
    end
  end

  describe '#add_link' do
    it 'should add new link to the database' do
      expect{subject.add_link({title: "Stackoverflow", url: "http://stackoverflow.com", tag: "tech"})}.to change{subject.list_links.length}.by 1
    end
  end

  describe '#show_tags' do
    it 'should show all the tags' do
      expect(subject.show_tags).to be_an_instance_of Array
      expect(subject.show_tags[0][:name]).to eql "Favourites"
    end
  end

  describe '#get_all_tags' do
    it 'gets all the tags from db' do
      expect(subject.get_all_tags).to be_an_instance_of DataMapper::Collection
    end
  end

  describe '#list_tags' do
    it 'should list out all the tags' do
      expect(subject.list_tags).to be_an_instance_of Array
      expect(subject.list_tags[0][:name]).to eql "Favourites"
    end
  end

  describe '#tag_formatter' do
    it 'formats the tag in to a hash' do
      tag = subject.get_all_tags[0]
      expect(subject.tag_formatter(tag)).to be_an_instance_of Hash
      expect(subject.tag_formatter(tag)[:name]).to eql "Favourites"
    end
  end

  describe '#show_bookmarks' do
    it 'displays all bookmarks data' do
      expect(subject.show_bookmarks).to be_an_instance_of Array
      expect(subject.show_bookmarks[0][:title]).to eql "Example Page"
    end
  end

end
