# coding: UTF-8

namespace :prowellness do

  # rake prowellness load_videos

  desc "Load videos task"
  task :load_videos => :environment do
    # Create the book or find it if exists
    book = Book.find_or_create_by_title("Entrénate")
    
    puts "**** Loading videos from book ENTRÉNATE"
    ###### PAGE 1 http://vimeo.com/user8690369/videos/page:1/sort:alphabetic
    book.videos.create :code => "114014", :video => '<iframe src="http://player.vimeo.com/video/31445085?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "115012", :video => '<iframe src="http://player.vimeo.com/video/31445136?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "115027", :video => '<iframe src="http://player.vimeo.com/video/31445212?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "115066", :video => '<iframe src="http://player.vimeo.com/video/31445350?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "120038", :video => '<iframe src="http://player.vimeo.com/video/31445725?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "120046", :video => '<iframe src="http://player.vimeo.com/video/31445774?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "120052", :video => '<iframe src="http://player.vimeo.com/video/31445804?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "120103", :video => '<iframe src="http://player.vimeo.com/video/31445828?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "120109", :video => '<iframe src="http://player.vimeo.com/video/31445926?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "120132", :video => '<iframe src="http://player.vimeo.com/video/31445968?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "120153", :video => '<iframe src="http://player.vimeo.com/video/31445995?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "120211", :video => '<iframe src="http://player.vimeo.com/video/31446045?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'

    ###### PAGE 2 http://vimeo.com/user8690369/videos/page:2/sort:alphabetic
    book.videos.create :code => "120215", :video => '<iframe src="http://player.vimeo.com/video/31446077?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "121012", :video => '<iframe src="http://player.vimeo.com/video/31445583?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "121022", :video => '<iframe src="http://player.vimeo.com/video/31445612?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "121122", :video => '<iframe src="http://player.vimeo.com/video/31445661?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "121132", :video => '<iframe src="http://player.vimeo.com/video/31445682?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "122233", :video => '<iframe src="http://player.vimeo.com/video/31446113?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "122542", :video => '<iframe src="http://player.vimeo.com/video/31446161?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "122552", :video => '<iframe src="http://player.vimeo.com/video/31446189?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "123004", :video => '<iframe src="http://player.vimeo.com/video/31507228?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "123005", :video => '<iframe src="http://player.vimeo.com/video/31507282?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "123010", :video => '<iframe src="http://player.vimeo.com/video/31507311?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "123102", :video => '<iframe src="http://player.vimeo.com/video/31507357?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'

    ###### PAGE 3 http://vimeo.com/user8690369/videos/page:3/sort:alphabetic
    book.videos.create :code => "123202", :video => '<iframe src="http://player.vimeo.com/video/31507390?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "123503", :video => '<iframe src="http://player.vimeo.com/video/31507441?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "123557", :video => '<iframe src="http://player.vimeo.com/video/31507499?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "123652", :video => '<iframe src="http://player.vimeo.com/video/31507526?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "123712", :video => '<iframe src="http://player.vimeo.com/video/31507546?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "124002", :video => '<iframe src="http://player.vimeo.com/video/31507581?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "124011", :video => '<iframe src="http://player.vimeo.com/video/31507614?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "124032", :video => '<iframe src="http://player.vimeo.com/video/32701848?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "124062", :video => '<iframe src="http://player.vimeo.com/video/31507688?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "124082", :video => '<iframe src="http://player.vimeo.com/video/31507725?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "124182", :video => '<iframe src="http://player.vimeo.com/video/31507746?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "125001", :video => '<iframe src="http://player.vimeo.com/video/31507775?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
 
    ###### PAGE 4 http://vimeo.com/user8690369/videos/page:4/sort:alphabetic
    book.videos.create :code => "125012", :video => '<iframe src="http://player.vimeo.com/video/31507824?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "125052", :video => '<iframe src="http://player.vimeo.com/video/31507847?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "125057", :video => '<iframe src="http://player.vimeo.com/video/31507878?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "125201", :video => '<iframe src="http://player.vimeo.com/video/31507916?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "125202", :video => '<iframe src="http://player.vimeo.com/video/31507961?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    # book.videos.create :code => "125202", :video => '<iframe src="http://player.vimeo.com/video/31507936?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "125205", :video => '<iframe src="http://player.vimeo.com/video/31507988?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "125302", :video => '<iframe src="http://player.vimeo.com/video/31508020?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "160011", :video => '<iframe src="http://player.vimeo.com/video/31445411?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "160026", :video => '<iframe src="http://player.vimeo.com/video/31445539?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "160036", :video => '<iframe src="http://player.vimeo.com/video/31375903?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "160105", :video => '<iframe src="http://player.vimeo.com/video/31376438?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'

    ###### PAGE 5 http://vimeo.com/user8690369/videos/page:5/sort:alphabetic
    book.videos.create :code => "170001", :video => '<iframe src="http://player.vimeo.com/video/31333938?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170002", :video => '<iframe src="http://player.vimeo.com/video/31334224?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170003", :video => '<iframe src="http://player.vimeo.com/video/31374723?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "170011", :video => '<iframe src="http://player.vimeo.com/video/31325026?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "170012", :video => '<iframe src="http://player.vimeo.com/video/31325093?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170013", :video => '<iframe src="http://player.vimeo.com/video/31325123?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "170014", :video => '<iframe src="http://player.vimeo.com/video/31325175?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170015", :video => '<iframe src="http://player.vimeo.com/video/31325200?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170022", :video => '<iframe src="http://player.vimeo.com/video/31444235?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "170023", :video => '<iframe src="http://player.vimeo.com/video/31444490?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "170031", :video => '<iframe src="http://player.vimeo.com/video/31374748?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    # Este tiene este código pero no es el que corresponde al que debería. Este es "Crunch en máquina"
    # book.videos.create :code => "170031", :video => '<iframe src="http://player.vimeo.com/video/31333625?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'

    ###### PAGE 6 http://vimeo.com/user8690369/videos/page:6/sort:alphabetic
    book.videos.create :code => "170032", :video => '<iframe src="http://player.vimeo.com/video/31374774?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170033", :video => '<iframe src="http://player.vimeo.com/video/31374813?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170040", :video => '<iframe src="http://player.vimeo.com/video/31375319?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "170041", :video => '<iframe src="http://player.vimeo.com/video/31375495?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "170042", :video => '<iframe src="http://player.vimeo.com/video/31375517?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170043", :video => '<iframe src="http://player.vimeo.com/video/31375550?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "170044", :video => '<iframe src="http://player.vimeo.com/video/31375569?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170045", :video => '<iframe src="http://player.vimeo.com/video/31375590?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170046", :video => '<iframe src="http://player.vimeo.com/video/31449167?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "170047", :video => '<iframe src="http://player.vimeo.com/video/31449215?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "170050", :video => '<iframe src="http://player.vimeo.com/video/31449241?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170051", :video => '<iframe src="http://player.vimeo.com/video/31449263?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'

    ###### PAGE 7 http://vimeo.com/user8690369/videos/page:7/sort:alphabetic
    book.videos.create :code => "170052", :video => '<iframe src="http://player.vimeo.com/video/31449286?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170053", :video => '<iframe src="http://player.vimeo.com/video/31449306?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170054", :video => '<iframe src="http://player.vimeo.com/video/31450597?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "170055", :video => '<iframe src="http://player.vimeo.com/video/31450631?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "170056", :video => '<iframe src="http://player.vimeo.com/video/31450749?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170057", :video => '<iframe src="http://player.vimeo.com/video/31450784?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "170060", :video => '<iframe src="http://player.vimeo.com/video/31448670?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170061", :video => '<iframe src="http://player.vimeo.com/video/31448752?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170062", :video => '<iframe src="http://player.vimeo.com/video/31448782?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "170063", :video => '<iframe src="http://player.vimeo.com/video/31448875?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "170064", :video => '<iframe src="http://player.vimeo.com/video/31449028?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170065", :video => '<iframe src="http://player.vimeo.com/video/31449066?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'

    ###### PAGE 8 http://vimeo.com/user8690369/videos/page:8/sort:alphabetic
    book.videos.create :code => "170066", :video => '<iframe src="http://player.vimeo.com/video/31376185?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170067", :video => '<iframe src="http://player.vimeo.com/video/31376228?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170068", :video => '<iframe src="http://player.vimeo.com/video/31376282?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "170069", :video => '<iframe src="http://player.vimeo.com/video/31376338?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "170070", :video => '<iframe src="http://player.vimeo.com/video/31448012?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170071", :video => '<iframe src="http://player.vimeo.com/video/31448094?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "170072", :video => '<iframe src="http://player.vimeo.com/video/31448301?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170080", :video => '<iframe src="http://player.vimeo.com/video/31374347?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "170081", :video => '<iframe src="http://player.vimeo.com/video/31374428?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "170082", :video => '<iframe src="http://player.vimeo.com/video/31374482?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "170083", :video => '<iframe src="http://player.vimeo.com/video/31375839?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    # LAST VIDEO


    # Create the book or find it if exists
    book = Book.find_or_create_by_title("Mujer en forma")
    
    puts "**** Loading videos from book MUJER EN FORMA"

    ###### PAGE 8 http://vimeo.com/user8690369/videos/page:8/sort:alphabetic
    book.videos.create :code => "214011", :video => '<iframe src="http://player.vimeo.com/video/32898857?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    

    ###### PAGE 9 http://vimeo.com/user8690369/videos/page:9/sort:alphabetic
    book.videos.create :code => "220001", :video => '<iframe src="http://player.vimeo.com/video/32898923?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "220111", :video => '<iframe src="http://player.vimeo.com/video/32899219?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "220221", :video => '<iframe src="http://player.vimeo.com/video/32899246?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "220311", :video => '<iframe src="http://player.vimeo.com/video/32899262?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "223001", :video => '<iframe src="http://player.vimeo.com/video/32899285?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "223002", :video => '<iframe src="http://player.vimeo.com/video/32899349?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "223101", :video => '<iframe src="http://player.vimeo.com/video/32911605?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "223105", :video => '<iframe src="http://player.vimeo.com/video/32911653?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "223201", :video => '<iframe src="http://player.vimeo.com/video/32911851?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "223202", :video => '<iframe src="http://player.vimeo.com/video/32912278?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "223211", :video => '<iframe src="http://player.vimeo.com/video/32912984?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "226001", :video => '<iframe src="http://player.vimeo.com/video/32913455?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    

    ###### PAGE 10 http://vimeo.com/user8690369/videos/page:10/sort:alphabetic
    book.videos.create :code => "226012", :video => '<iframe src="http://player.vimeo.com/video/32913675?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "226020", :video => '<iframe src="http://player.vimeo.com/video/32913814?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "226201", :video => '<iframe src="http://player.vimeo.com/video/32913930?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "226202", :video => '<iframe src="http://player.vimeo.com/video/32914008?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "226203", :video => '<iframe src="http://player.vimeo.com/video/32914222?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "226212", :video => '<iframe src="http://player.vimeo.com/video/33623451?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    # REPETIDO
    book.videos.create :code => "226213", :video => '<iframe src="http://player.vimeo.com/video/33623679?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "226250", :video => '<iframe src="http://player.vimeo.com/video/33623724?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "226301", :video => '<iframe src="http://player.vimeo.com/video/33623758?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "226302", :video => '<iframe src="http://player.vimeo.com/video/33623832?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "226401", :video => '<iframe src="http://player.vimeo.com/video/33623875?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    

    ###### PAGE 11 http://vimeo.com/user8690369/videos/page:11/sort:alphabetic
    book.videos.create :code => "231200", :video => '<iframe src="http://player.vimeo.com/video/33623951?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "231315", :video => '<iframe src="http://player.vimeo.com/video/33623996?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "240001", :video => '<iframe src="http://player.vimeo.com/video/33624043?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "240002", :video => '<iframe src="http://player.vimeo.com/video/33624587?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "240003", :video => '<iframe src="http://player.vimeo.com/video/33624980?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "240006", :video => '<iframe src="http://player.vimeo.com/video/33625084?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "240007", :video => '<iframe src="http://player.vimeo.com/video/33625217?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "240050", :video => '<iframe src="http://player.vimeo.com/video/33625404?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "240056", :video => '<iframe src="http://player.vimeo.com/video/33626013?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "240060", :video => '<iframe src="http://player.vimeo.com/video/33626246?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "240101", :video => '<iframe src="http://player.vimeo.com/video/33626304?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "240102", :video => '<iframe src="http://player.vimeo.com/video/33626397?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    

    ###### PAGE 12 http://vimeo.com/user8690369/videos/page:12/sort:alphabetic
    book.videos.create :code => "240105", :video => '<iframe src="http://player.vimeo.com/video/33626491?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "240110", :video => '<iframe src="http://player.vimeo.com/video/33626560?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "240120", :video => '<iframe src="http://player.vimeo.com/video/33626760?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "240121", :video => '<iframe src="http://player.vimeo.com/video/33626868?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "240201", :video => '<iframe src="http://player.vimeo.com/video/33626902?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "240202", :video => '<iframe src="http://player.vimeo.com/video/33626939?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "240210", :video => '<iframe src="http://player.vimeo.com/video/33626966?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "240401", :video => '<iframe src="http://player.vimeo.com/video/33626998?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "240402", :video => '<iframe src="http://player.vimeo.com/video/33627027?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    
    book.videos.create :code => "240501", :video => '<iframe src="http://player.vimeo.com/video/33627089?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    
    book.videos.create :code => "240502", :video => '<iframe src="http://player.vimeo.com/video/33627220?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "248010", :video => '<iframe src="http://player.vimeo.com/video/33628725?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'    

    ###### PAGE 13 http://vimeo.com/user8690369/videos/page:13/sort:alphabetic
    book.videos.create :code => "280010", :video => '<iframe src="http://player.vimeo.com/video/33628825?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'
    book.videos.create :code => "280120", :video => '<iframe src="http://player.vimeo.com/video/33628865?title=0&amp;byline=0&amp;portrait=0&amp;color=346F87" width="667" height="500" frameborder="0" webkitAllowFullScreen allowFullScreen></iframe>'


  end

end