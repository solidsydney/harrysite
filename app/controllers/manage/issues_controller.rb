class Manage::IssuesController < Manage::BaseController
  def index
    @issues = Issue.order("created_at desc")
  end

  def new
    @issue = Issue.new
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      redirect_to manage_issue_path(@issue), notice: 'Mag was successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.update_attributes(issue_params)
      redirect_to manage_issue_path(@issue), notice: "Updated Mag"
    else
      render action: 'edit'
    end
  end

  def deactivate
    @issue = Issue.find(params[:id])
    @issue.active = false
    @issue.save
    redirect_to manage_issues_url
  end

  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy
    redirect_to manage_issues_url
  end

  def show_pdf
    @issue = Issue.find(params[:id])
    send_file(@issue.mag.path(:original), :filename => @issue.title, :disposition => 'inline', :type => "application/pdf")
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description, :mag, :publish_on, :cover, :mag_url, :url)
  end
end
