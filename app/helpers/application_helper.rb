# coding: UTF-8

module ApplicationHelper

  def title
    title = ["ProWellness"]
    if action_name == 'home'
      title << "Domingo Sánchez"
    end

    if @categories
      if @post
        title << translate_category(@categories.first)
        title << @post.title
      else
        title << translate_category(@categories.first)
        title << translate_category(@categories[1]) if @categories.size > 1
      end
    end

    if controller_name == 'books'
      title << "Editorial"
    end
    if controller_name == 'images'
      title << "Galería de imágenes"
    end
    if action_name == 'about'
      title << "Sobre ProWellness"
    end
    if controller_name == 'search'
      title << "Buscar"
    end

    return truncate(title.join(" - "), :length => 67)
  end

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
    Post::CATEGORIES.map do |k,v|
      [k,v]
    end
  end

  def posts_pagination(posts)
    action_name = params[:action] == 'month_exercises' ? 'month_exercises' : 'index'
    paginate(posts, :remote => true, :params => {:action => action_name, :controller => controller_name})
  end

  def visual_guide_posts_pagination(posts, category)
    paginate(posts, {
      :remote => true,
      :params => {:action => 'index', :controller => 'visual_guide_posts', :category => category},
      :theme => :visual_guide_paginator
    })
  end

  def load_mercury?
    controller_name == 'posts' && action_name != 'index'
  end

  def select_visual_guide_subcategories(category, subcategory)
    options = case category
      when 'abdominales'
        [
          ["todos los niveles", nil],
          ["nivel 1 - activación", "nivel-1-activacion"],
          ["nivel 2 - estables", "nivel-2-estables"],
          ["nivel 3 - en apoyo", "nivel-3-en-apoyo"],
          ["nivel 4 - con material", "nivel-4-con-material"],
          ["nivel 5 - potencia", "nivel-5-potencia"]
        ]
      when 'estiramientos'
        [
          ["todos los tipos", nil],
          ["pantorrilla", "pantorrilla"],
          ["músculo", "musculo"],
          ["cadera", "cadera"],
          ["tronco", "tronco"],
          ["pectoral", "pectoral"],
          ["dorsal", "dorsal"],
          ["hombro", "hombro"],
          ["brazo", "brazo"],
          ["antebrazo", "antebrazo"]
        ]
    end
    select_tag("subcategory",options_for_select(options, subcategory), :class => 'custom-select')
  end

  def nice_slug(str)
    accents = {
      ['á','à','â','ä','ã'] => 'a',
      ['Ã','Ä','Â','À','�?'] => 'A',
      ['é','è','ê','ë'] => 'e',
      ['Ë','É','È','Ê'] => 'E',
      ['í','ì','î','ï'] => 'i',
      ['�?','Î','Ì','�?'] => 'I',
      ['ó','ò','ô','ö','õ'] => 'o',
      ['Õ','Ö','Ô','Ò','Ó'] => 'O',
      ['ú','ù','û','ü'] => 'u',
      ['Ú','Û','Ù','Ü'] => 'U',
      ['ç'] => 'c', ['Ç'] => 'C',
      ['ñ'] => 'n', ['Ñ'] => 'N'
      }
    accents.each do |ac,rep|
      ac.each do |s|
      str = str.gsub(s, rep)
      end
    end
    str = str.gsub(/[^a-zA-Z0-9 ]/,"")

    str = str.gsub(/[ ]+/," ")
    str = str.gsub(/ /,"-")
    return str
  end

  def css_class(post)
    'level '+ nice_slug(translate_category(post.categories.last).split(' - ').first.downcase.delete(' '))
  end

  def tag_path(tag_name)
    search_path(:q => "tag:#{tag_name}")
  end

  def month_exercise?
    return (controller_name == "articles" && action_name == "show" && !@category.nil? && @category == "Ejercicio del mes") || (controller_name == "month_exercises")
  end

  # Depending on each its controller_name or action name it returns its propertly section
  def current_section
    case controller_name
      when "site"
        case action_name
          when "home"
            return "home"
          when "about"
            return "sobre-prowellness"
        end
      # ARTÍCULOS
      when "articles"
        case action_name
          when "index"
            case @category
              when "Artículos"
                return "articulos"
              when "Fitness"
                return "fitness"
              when "Nutrición"
                return "nutricion"
              when "Mujer"
                return "mujer"
              when "Mi opinión"
                return "mi-opinion"
            end
          when "month_exercises"
            case @category
              when "Artículos"
                return "ejercicios-mes"
            end
        end
      when "visual_guide_posts"
        return "guia-visual"
      when "blog_posts"
        return "blog"
      when "books"
        return "editorial"
      when "book_videos"
        return "videos-editorial"
      when "images"
        return "imagenes"
    end

  end
end
