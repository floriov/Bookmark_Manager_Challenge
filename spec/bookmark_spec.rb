require 'bookmark'

describe Bookmark do
  
  let(:url) { 'http://www.youtube.com/' }
  let(:title) { 'Test Title' }
  
  describe '.all' do
    it 'returns all bookmarks' do
      Bookmark.add("http://www.makersacademy.com/", 'Makers Academy')
      Bookmark.add("http://www.destroyallsoftware.com/", 'Destroy all software')
      Bookmark.add("http://www.google.com/", 'google')
      
      bookmarks = Bookmark.all
      
      expect(bookmarks).to include({:title => "Makers Academy", :url => "http://www.makersacademy.com/"})
      expect(bookmarks).to include({:title => "Destroy all software", :url => "http://www.destroyallsoftware.com/"})
      expect(bookmarks).to include({:title => "google", :url => "http://www.google.com/"})
    end
  end

  describe '.add'
    it 'adds a bookmark to the database' do
      bookmark = Bookmark.add(url, title).first
      #expect(Bookmark.all).to include({title: title, url: url})
      expect(bookmark['url']).to eq url
      expect(bookmark['title']).to eq title
    end
end

#Walkthrough Comments - Stel 11
# describe '.all' do
#   it 'returns a list of bookmarks' do
#     connection = PG.connect(dbname: 'bookmark_manager_test')
 
#     # Add the test data
#     bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
#     Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
#     Bookmark.create(url: "http://www.google.com", title: "Google")
 
#     bookmarks = Bookmark.all
 
#     expect(bookmarks.length).to eq 3
#     expect(bookmarks.first).to be_a Bookmark
#     expect(bookmarks.first.id).to eq bookmark.id
#     expect(bookmarks.first.title).to eq 'Makers Academy'
#     expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
#    end
#  end