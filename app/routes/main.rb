require 'rubygems'
require 'yaml'
require 'mongoid'
require 'optparse'
require File.dirname(__FILE__) + '../models/mongoid_db'

class Walker < Sinatra::Application
  Mongoid.load!("./config/mongoid.yml")

  def initialize_database
    amount = Pledge.new(amount: 0)
    amount.save
  end

  def update_pledge_amount(pledge)
    amount = Pledge.distinct(:amount)
    pledged = amount.first + pledge
    Pledge.first.set(:amount, pledged)
    Pledge.first.save
    pledged
  end

  def retrieve_pledges
    Pledge.distinct(:amount).first.to_s
  end

  get '/' do
    @pledges = retrieve_pledges
    puts @pledges
    haml :index
  end

  get '/pledges' do
    retrieve_pledges
  end

  post '/pledge' do
    pledge_name = params[:pledge_name]
    pledge_email = params[:pledge_email]
    pledge_amount = params[:pledge_amount]
    dollars = pledge_amount == '1' ? 'dollar' : 'dollars'
    pledged = update_pledge_amount(pledge_amount.to_i)
    mail = Mail.deliver do
      to EMAIL['sendgrid']['emails']
      from pledge_email
      subject "#{pledge_name} has pledged #{pledge_amount} dollars" 
    end 
  "Thanks for your pledge! You will recieve a paypal request for #{pledge_amount} #{dollars}."
  end
end


