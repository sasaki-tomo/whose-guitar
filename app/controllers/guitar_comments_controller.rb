class GuitarCommentsController < ApplicationController
  def create
    guitar = Guitar.find(params[:guitar_id])
    comment = current_user.guitar_comments.new(guitar_comment_params)
    comment.guitar_id = guitar.id
   if comment.save
     redirect_back(fallback_location: guitars_path)
 　else
　   redirect_back(fallback_location: guitars_path)
　 end
  end

  def destroy
    GuitarComment.find_by(id: params[:id], guitar_id: params[:guitar_id]).destroy
    redirect_back(fallback_location: guitars_path)
  end

	private
	def guitar_comment_params
		params.require(:guitar_comment).permit(:comment)
	end
end
