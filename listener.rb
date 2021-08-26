#!/usr/bin/env ruby
require 'listen'

watch_patterns = %w(templates main.rb)

listener = Listen.to('./') do |modified, added, removed|
  has_modified_file = modified.any? do |path|
    watch_patterns.any? { |pattern| path.include?(pattern) }
  end

  if has_modified_file || added.count > 0 || removed.count > 0
    puts(:modified => modified, :added => added, :removed => removed)
    puts `./main.rb`
  end
end
listener.start
sleep