Rails.application.routes.draw do
 befor action :set_bookname, only:[:show, :edit, :update, :destory]
  
  def index
    @bookname=Bookname.all
  end
  
  def show
  end
  
  def new 
    @bookname=Bookname.new
  end
  
  def edit
  end
  
  def create
    @bookname =Bookname.new(book_params)
    
    respond_to do |format|
      if  @bookname.save
        format.html{redirect_to  @bookname, notice:'success create'}
      else
     format.html{render new}
      end
    end
  end
  
 def update
    respond_to do |format|
      if  @bookname.update(book_params)
        format.html{redirect_to  @bookname, notice:'success update'}
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

    def set_bookname
       @bookname = Bookname.find(params[:id])
    end
  def book_params
    params.require(:user).permit(:name, :email, :password)
   end
end
