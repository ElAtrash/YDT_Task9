class UsersController < ApplicationController

  def index
    @users = User.where(:type => params[:type])
  end

  def show
    @user = User.find(params[:id]).decorate
  end

  def new
    @user = User.new
    @user.type = params[:type]
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.type = params[:type]

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])

    log_service = LogService.new
    log_service.log_changes(@user)

    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

    def user_params
      params.require(params[:type].try(:downcase) || :user).permit(:type, :login, :email)
    end
end
