require 'rubygems'
require 'optparse'
require 'active_resource'
require File.expand_path(File.dirname(__FILE__) + '/config/database')

class Pledge < ActiveRecord::Base
end

def options
  options = {}
  optparse = OptionParser.new do |opts|
    options[:reset] = false

    opts.on('-r', '--reset', 'Reset or initialize database') do
      options[:reset] = true
    end
    opts.on('h', '--help', 'Display this screen') do 
      puts opts
      exit
    end
  end
    
    optparse.parse!

  if options[:reset]
    Pledge.create!(:amount => 0)
  end
end

options

