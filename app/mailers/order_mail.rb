class OrderMail < ApplicationMailer

  def index order, user
    @order = order
    @user = user
    mail to: Settings.email_admin
  end
end
