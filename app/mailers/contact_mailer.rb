class ContactMailer < ApplicationMailer

  default to: "cri.gacitua.flores@gmail.com"
  default from: "cri.gacitua.flores@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.home_form.subject
  #
  def home_form(name, email, message)
    @name = name
    @email = email
    @message = message

    mail subject: 'Contact Form'
  end
end
