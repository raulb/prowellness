# coding: UTF-8

namespace :prowellness do

  # rake prowellness load_videos

  desc "Load videos task"
  task :load_videos => :environment do
    # Create the book or find it if exists
    book = Book.find_or_create_by_title("Entrénate")
    # Create a video for the book
    book.videos.create :code => "125302", :video => '<iframe src="http://player.vimeo.com/video/31508020?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    # add more videos...

    # Create the book or find it if exists
    book = Book.find_or_create_by_title("Mujer")
    # Create a video for the book
    book.videos.create :code => "125302", :video => '<iframe src="http://player.vimeo.com/video/31508020?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    # add more videos...
  end

end