class SecretsController < ApplicationController
  def new
    render :new
  end

  def create
    @secret = Secret.new(params[:secret])
    @secret.author = current_user

    if @secret.save
      redirect_to user_url(@secret.recipient_id)
    else
      flash.now[:errors] = @secret.errors.full_messages
      render :new
    end
  end
end
