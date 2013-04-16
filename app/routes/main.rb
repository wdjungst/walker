class Walker < Sinatra::Application
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
