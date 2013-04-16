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

  post '/pledge' do
    pledge_name = params[:pledge_name]
    pledge_mail = params[:pledge_email]
    pledge_amount = params[:pledge_amount]
    mail = Mail.deliver do
      to EMAIL['sendgrid']['emails']
      from contact_mail
      subject "#{contact_name} has pledged #{pledge_amount} dollars" 
    end 
  "Thanks for your pledge! You will recieve a paypal request for #{pledge_amount}."
  end
end


