class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @link = Link.find(link_params[:link_id])
    @body = link_params[:body]
    @user_who_commented = current_user
    @comment = Comment.build_from( @link, @user_who_commented.id, @body )

    respond_to do |format|
      if @comment.save
        format.html  { redirect_to(link_path(@link),
                      :notice => 'Comment was successfully added.') }
      else
        format.html  { render :action => "new" }
      end
    end
  end

  private

  def link_params
    params.require(:comment).permit(:body, :link_id)
  end

end
