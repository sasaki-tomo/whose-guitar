class GuitarsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, {only: [:edit,:update,:destroy]}

  def show
    @guitar_new = Guitar.new
    @guitar = Guitar.find(params[:id])
    @user = @guitar.user
    @guitar_comment = GuitarComment.new
    
  end

  def index
    @user = current_user
    @guitars = Guitar.all
    @guitar = Guitar.new
  end

 def create
    @user = current_user
    @guitar = Guitar.new(guitar_params)
    @guitar.user_id = (current_user.id)
  if @guitar.save
    flash[:notice] = "You have creatad guitar successfully."
     @guitars = Guitar.all
     redirect_to "/guitars/#{@guitar.id}"
  else
     @guitars = Guitar.all
     flash[:notice] = ' errors prohibited this obj from being saved:'
     render "index"
  end
 end

  def edit
    @guitar = Guitar.find(params[:id])
  end

  def update
    @guitar = Guitar.find(params[:id])
    if @guitar.update(guitar_params)
      redirect_to guitar_path(@guitar), notice: "You have updated guitar successfully."
    else
      @guitars = Guitar.all
      render "edit"
    end
  end

  def destroy
    @guitar = Guitar.find(params[:id])
    @guitar.destroy
    redirect_to guitars_path
  end

  private

  def guitar_params
    params.require(:guitar).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
  
  def ensure_current_user
      @guitar = Guitar.find(params[:id])
   if @guitar.user_id != current_user.id
      redirect_to guitars_path
   end
  end
end