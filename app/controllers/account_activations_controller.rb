class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user
      if !user.activated? && user.authenticated?(:activation, params[:id])
        user.activate
        log_in user
        flash[:success] = t "activated"
        redirect_to user
      else
        flash[:danger] = t "invalid_activation_link"
        redirect_to root_url
      end
    else
      flash[:danger] = t "not_found"
      redirect_to root_path
    end
  end
end
