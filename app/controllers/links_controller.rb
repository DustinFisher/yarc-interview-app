class LinksController < ApplicationController
  before_action :authenticate_account!

  def show
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.account_id = current_account.id

    respond_to do |format|
      if @link.save
        format.html  { redirect_to(root_path,
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
