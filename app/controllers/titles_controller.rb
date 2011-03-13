class TitlesController < ApplicationController
  # GET /titles/1
  # GET /titles/1.xml
  # GET /titles/1.json
  def show
    @title = Title.find_by_isbn13(params[:id])
    @watching = Watching.new
    
    respond_to do |format|
      format.html
#       format.xml  { render :xml => @title }
#       format.json { render :json => @title }
    end
  end
end
