# coding: UTF-8

module ApplicationHelper

  def flush_the_flash
    if flash[:alert]
      notice_div(flash[:alert], 'error')
    elsif flash[:notice]
      notice_div(flash[:notice], 'notice')
    elsif flash[:success]
      notice_div(flash[:success], 'success')
    end
  end

  def notice_div(text, extra_class = nil)
    content_tag(:div, :class => 'flashes') do
      content_tag(:div, :class => [ 'message', extra_class ].join(' ')) do
        content_tag(:p, raw(text))
      end
    end
  end

  def notice_about_drafts
    if Post.draft.count > 0
      posts = ""
      Post.draft.each do |post|
        posts += content_tag(:li) do
          link_to(post.title, edit_admin_post_path(post))
        end
      end
      return content_tag(:div, :class => 'flashes') do
        content_tag(:div, :class => 'message notice') do
          content_tag(:p, "Hay #{pluralize(Post.draft.count, 'borrador pendiente', 'borradores pendientes')} de publicar") +
          content_tag(:ul) do
            posts.html_safe
          end
        end
      end
    end
  end

  def post_status(post)
    content_tag(:span, :style => "color:#{post.draft? ? 'red' : 'green'}") do
      '[' + (post.draft? ? "Borrador" : "Publicado") + ']'
    end.html_safe
  end

  def categories_for_select
    Post::CATEGORY.map do |k,v|
      [k,v]
    end
  end

end
