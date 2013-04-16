require 'rubygems'
require 'yaml'
require 'optparse'
require File.dirname(__FILE__) + '/mongoid_db'

class Walker < Sinatra::Application
  def initialize_database
    amount = Pledge.new(amount: 0.00)
    amount.save
  end

  def pledge_amount
    
  end  
  
  get '/' do
    haml :index
  end
end


