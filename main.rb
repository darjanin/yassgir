#!/usr/bin/env ruby
require 'json'
require 'reverse_markdown'
require 'nokogiri'
require 'haml'
require 'fileutils'

BUILD = 'docs'
MARKDOWN = 'markdown'
TEMPLATES = 'templates'
POSTS_PER_PAGE = 5

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
    :excerpt => post['excerpt']['rendered'],
    :content => post['content']['rendered'],
    :author => post['author']
  }
end
# p posts1[0]['link']

def save_html(filename, html)
  File.write(filename, html)
end

def render(template_name, locals = {})
  template = File.read("#{TEMPLATES}/#{template_name}.html.haml")
  Haml::Engine.new(template).render(self, locals)
end

def html_wrap(html, title = "VacuumBlog")
  render('layout', {:title => title, :html => html})
end

def generate_index(list)
  pagination = {
    :active => 1,
    :total => list.count / POSTS_PER_PAGE
  }
  save_html("#{BUILD}/index.html", html_wrap(render('posts', {:list => list, :pagination => pagination})))
end

def generate_posts_page(list)
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


def generate_markdown_for_posts(list)
  list.each do |post| 
    File.write(
      "#{MARKDOWN}/#{post[:slug]}.md",
      [
        [
          "---",
          "title: #{post[:title]}",
          "excerpt: #{Nokogiri::HTML(post[:excerpt]).text.strip}",
          "date: #{post[:date]}",
          "slug: #{post[:slug]}",
          "---"
        ].join("\n"),
        "# #{post[:title]}",
        ReverseMarkdown.convert(post[:content])
      ].join("\n\n")
    )
  end
end

puts("MAIN: Rebuild.")
generate_index(list)
generate_posts_page(list)
# generate_markdown_for_posts(list)