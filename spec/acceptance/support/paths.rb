module NavigationHelpers
  def homepage
    "/"
  end
  
  def login_path
    "/login"
  end
  
  def logout_path
    "/logout"
  end
  
  def blog_path
    "/blog"
  end
end

RSpec.configuration.include NavigationHelpers, :type => :acceptance