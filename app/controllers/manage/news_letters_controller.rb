class Manage::NewsLettersController < Manage::BaseController
  def index
    @news_letters = NewsLetter.order("created_at desc")
  end

  def new
    @news_letter = NewsLetter.new
  end

  def edit
    @news_letter = NewsLetter.find(params[:id])
  end

  def show
    @news_letter = NewsLetter.find(params[:id])
  end

  def create
    @news_letter = NewsLetter.new(letter_params)
    if @news_letter.save
      redirect_to manage_news_letter_url(@news_letter), notice: 'News letter was successfully created.'
    else
      render action: "new"
    end
  end

  def send_now
    @news_letter = NewsLetter.find(params[:id])
    if Contact.any?
      Contact.active_contacts.find_each do |mailing_list|
        SubscriberLetterWorker.perform_async(mailing_list.id, @news_letter.id)
        #SubscriberMailer.send_news_letter(mailing_list, @news_letter).deliver
      end
      redirect_to manage_news_letter_path(@news_letter), notice: "Sent news Letter"
    else
      redirect_to manage_news_letter_path(@news_letter), alert: "Sorry no subscribers at the moment"
    end
  end

  def update
    @news_letter = NewsLetter.find(params[:id])
    if @news_letter.update_attributes(letter_params)
      respond_to do |format|
        format.html {redirect_to manage_news_letter_path(@news_letter), notice: "Updated News letter"}
      end
    else
      render action: 'edit'
    end
  end

  def destroy
    @news_letter = NewsLetter.find(params[:id])
    @news_letter.destroy
    redirect_to manage_news_letters_path, notice: "Deleted News letter"
  end

  private

  def letter_params
     params.require(:news_letter).permit(:title, :body)
  end
end
