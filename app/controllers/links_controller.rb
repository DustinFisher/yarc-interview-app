class LinksController < ApplicationController
  before_action :authenticate_user!

  def show
    @link    = Link.find(params[:id])
    @comment = Comment.new
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id

    respond_to do |format|
      if @link.save
        format.html  { redirect_to(link_path(@link),
                      :notice => 'Link was successfully created.') }
      else
        format.html  { render :action => "new" }
      end
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
