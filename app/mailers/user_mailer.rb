class UserMailer < ApplicationMailer
  include Rails.application.routes.url_helpers
  def send_notification_mail(product)
    @product = product
    @user = @product.likes.order(:created_at).last.user
    attachments['product.jpg'] = { mime_type: 'image/jpeg', content: product.image.download } if product.image.attached?
    mail(to: @user.email, subject: 'Snack Store')
  end
end
