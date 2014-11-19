#!/usr/bin/env ruby
require 'mkmf'

if find_executable 'lsrc' && `lsrc`.strip.size != 0
  puts 'already provisioned. use lsrc, rcup, mkrc, etc'
  exit 0
end

unless find_executable 'rcup'
  puts 'rcm not available. installing via brew...'
  if find_executable 'brew'
    system('brew tap thoughtbot/formulae && brew install rcm')
  else
    puts 'failure. rcm and brew not available.'
    exit 1
  end
end

dotfiles_path = File.expand_path(File.join(__FILE__, '../..'))
rcrc_file     = File.expand_path(File.join(dotfiles_path, 'rcrc'))

system "cp #{rcrc_file} ~/.rcrc"
system "cd && rcup"
