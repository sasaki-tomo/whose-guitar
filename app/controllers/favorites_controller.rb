class FavoritesController < ApplicationController
  
  def create
    guitar = Guitar.find(params[:guitar_id])
    favorite = current_user.favorites.new(guitar_id: guitar.id)
    favorite.save
    redirect_back(fallback_location: guitars_path)
  end
  
  def destroy
    guitar = Guitar.find(params[:guitar_id])
    favorite = current_user.favorites.find_by(guitar_id: guitar.id)
    favorite.destroy
    redirect_back(fallback_location: guitars_path)
  end
  
end