#!/usr/bin/env ruby
require 'mkmf'

dotfiles_path = File.expand_path(File.join(__FILE__, '../..'))

unless find_executable 'rcup'
  puts 'rcm not available. installing via brew...'
  if find_executable 'brew'
    system('brew tap thoughtbot/formulae && brew install rcm')
  else
    puts 'failure. rcm and brew not available.'
    exit 1
  end
end

system("cd && rcup -d #{dotfiles_path}")
