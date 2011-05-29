class BoardsController < ApplicationController
  # GET /boards
  # GET /boards.xml
  def index
    @boards = Board.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @boards }
    end
  end

  # GET /boards/1
  # GET /boards/1.xml
  def show
    @board = Board.find(params[:id])
    @posts = @board.posts.recent.paginate(:page => params[:page], :per_page => 5 )
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @board }
    end
  end

end
