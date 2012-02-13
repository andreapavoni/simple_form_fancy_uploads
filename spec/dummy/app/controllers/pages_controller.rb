class PagesController < ApplicationController

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        redirect_to @page, notice: 'Page was successfully created.'
      else
        render action: :new
      end
    end
  end

  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        redirect_to @page, notice: 'Page was successfully updated.'
      else
        render action: :edit
      end
    end
  end

end
