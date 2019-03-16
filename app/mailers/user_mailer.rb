class UserMailer < ApplicationMailer
  include Rails.application.routes.url_helpers
  def send_notification_mail(product)
    @product = product
    @user = @product.likes.order(:created_at).last.user
    attachments['product.jpg'] = File.read(ActiveStorage::Blob.service.send(:path_for, product.image.key)) if product.image.attached?
    mail(to: @user.email, subject: 'Simple Demo to showcase Active Job')
  end
end