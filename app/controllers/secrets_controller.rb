class SecretsController < ApplicationController
  def new
    render :new
  end

  def create
    @secret = Secret.new(params[:secret])
    @secret.author = current_user

    if @secret.save
      render :json => @secret
    else
      flash.now[:errors] = @secret.errors.full_messages
      render :new
    end
  end
end
