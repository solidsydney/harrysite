class Manage::BaseController < ApplicationController
  #http_basic_authenticate_with :name => "blanckdigital", :password => "workstation"
  before_action :check_for_users
  before_action :authenticate_user!
  layout 'master'


  def ensure_administrators
    if user_signed_in?
      unless current_user.admin?

        flash[:error] = 'Access Denied'
        redirect_to(session["user_return_to"] || root_path)

      end

    end
  end

  private

  def ensure_administrators_or_editor
    if user_signed_in?
      unless current_user.admin?  || current_user.editor?

        flash[:error] = 'Access Denied'
        redirect_to(session["user_return_to"] || root_path)

      end

    end
  end

  def check_for_users
    unless User.administrators.exists? or (controller_name == 'registrations')
      redirect_to new_user_registration_path and return
    end
    if (controller_name == 'registrations') and (action_name == 'new') and User.administrators.exists?
      redirect_to user_session_path and return
    end
  end
end
