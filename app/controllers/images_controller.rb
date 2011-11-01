# coding: UTF-8

class ImagesController < ApplicationController

  def index
    FlickRaw.api_key = 'f8e9ae6998922f3f94306abcae441f63'
    FlickRaw.shared_secret = 'ec87323ddfb34ce7'
    
    flickr = FlickRaw::Flickr.new
    @photo_sets = flickr.photosets.getList(:user_id => "65545809@N07")
    
  end

end
