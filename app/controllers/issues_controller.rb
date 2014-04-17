class IssuesController < ApplicationController
  before_action :authenticate_user!, only: :show_pdf
  def index
    @issues = Issue.order("created_at desc").page(params[:page]).per_page(27)
  end

  def show
    @issue = Issue.find(params[:id])
    respond_to do |format|
      if mobile_device?
        format.html {render layout: "mobile"}
      else
        format.html {render layout: "application"}
      end
    end
  end

  def show_pdf
    @issue = Issue.find(params[:id])
    send_file(@issue.mag.path(:original), :filename => @issue.title, :disposition => 'inline', :type => "application/pdf")
  end
end
