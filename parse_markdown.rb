require 'reverse_markdown'
require 'json'

MARKDOWN = 'markdown'

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