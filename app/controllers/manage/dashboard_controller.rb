class Manage::DashboardController < Manage::BaseController
  skip_before_action :ensure_administrators
  before_action :ensure_administrators_or_editor
  def index

  end


end
