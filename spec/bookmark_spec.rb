# frozen_string_literal: true

require 'bookmark'
require_relative './features/web_helper'

describe Bookmark do
  describe '#all' do
    it 'should return all the element of an array' do
      add_test_bookmarks
      bookmark = Bookmark.all.first
      bookmark
      expect(bookmark.title).to eq('Makers')
      expect(bookmark.url).to eq('http://www.makersacademy.com')
    end
  end

  describe '#create' do
    it 'adds a new bookmark to database' do
      Bookmark.create('www.amazon.co.uk', 'Amazon')
      expect(Bookmark.all.first.title).to eq('Amazon')
    end
  end

  describe '#delete' do
    
     #allow(amazon).to receive(:id) { 1} 
    it 'deletes a bookmark from the database' do
      amazon = double(Bookmark.new('Amazon', 'www.amazon.co.uk', 1) )
      #xpect(Bookmark.all).to have_content('Amazon')
      Bookmark.delete(1)
      expect(Bookmark.all).to eq([])
    end
  end
  
end
