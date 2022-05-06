#!/usr/bin/env ruby
require 'json'
require 'nokogiri'
require 'haml'
require 'fileutils'
require 'colorize'

BUILD = 'docs'
TEMPLATES = 'templates'
POSTS_PER_PAGE = 12
DOMAIN = if ARGV.count == 1 then ARGV[0] else "/" end

file1 = File.read('./posts_page_1.json')
file2 = File.read('./posts_page_2.json')
posts1 = JSON.parse(file1)
posts2 = JSON.parse(file2)
list = (posts1 + posts2).map do |post|
  {
    :title => post['title']['rendered'],
    :date => post['date'],
    :slug => post['slug'],
    :link => post['link'],
    # remove the html tags from it
    :excerpt => post['excerpt']['rendered'].gsub(%r{</?[^>]+?>}, ''),
    :content => post['content']['rendered'],
    :author => post['author'],
    :preview_image => post['jetpack_featured_media_url']
  }
end
# p posts1[0]['link']

def save_html(filename, html)
  File.write(filename, html)
end

def get_domain
  DOMAIN
end

def render(template_name, locals = {})
  template = File.read("#{TEMPLATES}/#{template_name}.html.haml")
  Haml::Engine.new(template).render(self, locals)
end

def html_wrap(html, title = "VacuumBlog")
  render('layout', {:title => title, :html => html})
end

def generate_index(list)
  total = list.count / POSTS_PER_PAGE
  (1..total).each do |page|
    directory = "#{BUILD}/#{page}"
    FileUtils.mkdir(directory) unless File.directory?(directory)
    save_html("#{BUILD}/#{page}/index.html", html_wrap(render('posts', {:list => list[(POSTS_PER_PAGE * page - POSTS_PER_PAGE)...(page * POSTS_PER_PAGE)], :pagination => {:active => page, :total => total}})))  
  end
  save_html("#{BUILD}/index.html", html_wrap(render('posts', {:list => list[(POSTS_PER_PAGE * 1 - POSTS_PER_PAGE)...(1 * POSTS_PER_PAGE)], :pagination => {:active => 1, :total => total}})))  
end

def generate_post_pages(list)
  list.each do |post|
    directory = "#{BUILD}/post/#{post[:slug]}"
    FileUtils.mkdir(directory) unless File.directory?(directory)
    save_html("#{BUILD}/post/#{post[:slug]}/index.html", html_wrap(render('post_detail', post), post[:title]))
  end
end

def reading_time(post, words_per_minute = 150)
  text = Nokogiri::HTML(post[:content]).text
  (text.scan(/\w+/).length / words_per_minute).to_i
end


puts("main: " + "Rebuild.".green)
puts("main: " + "DOMAIN: " + DOMAIN.green)
generate_index(list)
generate_post_pages(list)
