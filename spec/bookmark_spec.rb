require 'bookmark'
require 'database_helpers'

describe Bookmark do
  
  let(:url) { 'http://www.youtube.com/' }
  let(:title) { 'Test Title' }
  
  describe '.get_all' do
    it 'returns all bookmarks' do
      bookmark = Bookmark.add("http://www.makersacademy.com/", 'Makers Academy')
      Bookmark.add("http://www.destroyallsoftware.com/", 'Destroy all software')
      Bookmark.add("http://www.google.com/", 'google')
      
      bookmarks = Bookmark.get_all
      
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy' 
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com/'
    end
  end

  describe '.add'
    it 'adds a bookmark to the database' do
      bookmark = Bookmark.add(url, title)
      persisted_data = persisted_data(bookmark.id)
      #expect(Bookmark.all).to include({title: title, url: url})
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Title'
      expect(bookmark.url).to eq 'http://www.youtube.com/'
    end
    
end

