class SapienMailer < ActionMailer::Base
  default from: "admin@animus.com"

  def welcome(sapien)
  	@sapien = sapien
  	@url = 'http://www.animus.com'
  	mail(to: @sapien.email, subject: "Welcome to Animus, your own world :)")
  end
end
