class Manage::AdministratorsController < Manage::BaseController
  def index
    @users = User.administrators
  end

  def new
    generated_password = User.generate_password
    @user = User.new(:password => generated_password,
                     :password_confirmation => generated_password)
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to edit_manage_administrator_path(@user), notice: 'User was successfully added.'
    else
      render action: "new"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      #@user.create_activity :create, owner: current_user
      redirect_to manage_administrator_url(@user), notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to manage_administrators_path
  end

  def change_password
    @user ||= User.find(params[:id])
    if current_user  == @user
      @user = User.find(params[:id])
    else
      render text: "Not Authorised", :layout => true, :status => 404
    end
  end

  def change_my_password
    @user = User.find(params[:id])
    if @user.update_with_password(password_params)
      sign_in @user, bypass: true
      redirect_to manage_administrator_url(@user), notice: 'Password Changed'
    else
      render :change_password
    end
  end

  private

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:first_name, :editor, :admin, :last_name, :email, :password_confirmation, :password, :superuser )
  end
end
