require 'rubygems'
require 'yaml'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => 'mysql',
  :host => 'localhost',
  :encoding => 'utf8',
  :database => 'walker',
  :username => 'root',
  :password => 'password'
)

class Pledge < ActiveRecord::Base
end


class Walker < Sinatra::Application

  def update_pledge_amount(pledge)
    unless pledge < 0
      amount = Pledge.find(:all).first.amount
      pledged = amount + pledge
      pledge = Pledge.first
      pledge.amount = pledged
      pledge.save
    end
    pledged
  end

  def retrieve_pledges
    Pledge.first.amount.to_s
  end

  get '/' do
    @pledges = retrieve_pledges
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


