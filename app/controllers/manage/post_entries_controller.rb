class Manage::PostEntriesController < Manage::BaseController
  before_action :set_post_entry, only: [:show, :edit, :update, :destroy]

  # GET /post_entries
  # GET /post_entries.json
  def index
   if params[:status] == "pending"
     @post_entries = PostEntry.pending.page(params[:page]).per_page(27)
   else
    @post_entries = PostEntry.published.page(params[:page]).per_page(27)
   end
  end

  # GET /post_entries/1
  # GET /post_entries/1.json
  def show
  end

  # GET /post_entries/new


  # GET /post_entries/1/edit
  def edit
  end

  def approve
    @post_entry = PostEntry.find(params[:id])
    @post_entry.update_attribute(:active, true)
    redirect_to :back
  end

  # POST /post_entries
  # POST /post_entries.json


  # PATCH/PUT /post_entries/1
  # PATCH/PUT /post_entries/1.json
  def update
    respond_to do |format|
      if @post_entry.update(post_entry_params)
        format.html { redirect_to [:manage, @post_entry], notice: 'Post entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_entries/1
  # DELETE /post_entries/1.json
  def destroy
    @post_entry.destroy
    respond_to do |format|
      format.html { redirect_to post_entries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_entry
      @post_entry = PostEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_entry_params
      params.require(:post_entry).permit(:title, :summary, :body, :name, :email, :entry_cover)
    end
end
