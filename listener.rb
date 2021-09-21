#!/usr/bin/env ruby
require 'listen'
require 'colorize'

watch_patterns = %w[html.haml .rb .md]

listener =
  Listen.to('./') do |modified, added, removed|
    has_modified_file =
      modified.any? do |path|
        watch_patterns.any? { |pattern| path.include?(pattern) }
      end

    if has_modified_file || added.count > 0 || removed.count > 0
      puts(modified.join("\n").blue)
      puts(added.join("\n").green)
      puts(removed.join("\n").red)
      puts `./main.rb`
    end
  end
listener.start
sleep
