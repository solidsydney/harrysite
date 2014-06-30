class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    if params[:email].present?
      redirect_to contact_us_url, :notice => "Your feedback message was caught by the spam filter because you filled in the invisible email field. Please try again without filling in the false email field and let me know that this happened."
    else
    @message = Message.new(contact_params)
    if @message.valid?
      MessageMailer.send_message(@message).deliver
      redirect_to contact_us_url, notice: "Message sent! Thank you for contacting us."
    else
      render "new"
    end
    end
  end

  private

  def contact_params
    params.require(:message).permit(:name, :message, :email)
  end

end
