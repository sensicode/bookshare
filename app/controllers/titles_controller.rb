class TitlesController < ApplicationController
  # POST /titles
  # POST /titles.xml
  def create
    @title = Title.create_from_isbn13(params[:isbn13])

    respond_to do |format|
      if @title.save
        format.html { redirect_to(@title, :notice => 'Title was successfully created.') }
        format.xml  { render :xml => @title, :status => :created, :location => @title }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @title.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # GET /titles/1
  # GET /titles/1.xml
  def show
    @title = Title.find(params[:id])
    @watching = Watching.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @title }
      format.json { render :json => @title }
    end
  end
end
