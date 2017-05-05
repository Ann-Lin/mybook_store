class UsersController < ApplicationController
  befor action :set_user, only:[:show, :edit, :update, :destory]
  
  def index
    @user=User.all
  end
  
  def show
  end
  
  def new 
    @user=User.new
  end
  
  def edit
  end
  
  def create
    @user =User.new(user_params)
    
    respond_to do |format|
      if @user.save
        format.html{redirect_to @user, notice:'success create'}
      else
     format.html{render new}
      end
    end
  end
  
 def update
    respond_to do |format|
      if @user.update(user_params)
        format.html{redirect_to @user, notice:'success update'}
      else
      format.html{render :edit}
      end
    end
  end
  
  def destory
    @user.destory
    respond_to do |format|
    format.html{redirect_to users_url, notice:'success destory'}
      end
    end

 private

    def set_user
      @user = User.find(params[:id])
    end
  def user_params
    params.require(:user).permit(:name, :email, :password)
   end
end
