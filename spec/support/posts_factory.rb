# coding: UTF-8

module Prowellness
  module Factories
    def new_post(attributes = {})
      attributes = attributes.dup
      post = Post.new
      post.title = attributes[:title] || String.random(5)
      post.excerpt = attributes[:excerpt] || String.random(10)
      post.body = attributes[:body] || String.random(10)
      post.categories = attributes[:categories] || [String.random(5), String.random(5), String.random(5)].join(',')
      post.tags = attributes[:tags] || [String.random(5), String.random(5), String.random(5)].join(',')
      post.user_id = attributes[:user].try(:id) || attributes[:user_id] || create_user.id
      post.published = attributes[:published].nil? ? true : attributes[:published]
      post
    end

    def create_post(attributes = {})
      post = new_post(attributes)
      post.save
      post
    end
    
  end
end