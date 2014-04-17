class Manage::BaseController < ApplicationController
  http_basic_authenticate_with :name => "blanckdigital", :password => "workstation"
  #before_action :authenticate_user!
  #before_action :ensure_administrators
  layout 'master'


  def ensure_administrators
    if user_signed_in?
      unless current_user.admin?

        flash[:error] = 'Access Denied'
        redirect_to(session["user_return_to"] || root_path)

      end

    end
  end
end
