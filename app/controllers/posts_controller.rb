class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    @board = Board.find(params[:board_id])
    redirect_to board_path(@board)
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @board = Board.find(params[:board_id])
    @post = @board.posts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @board = Board.find(params[:board_id])
    @post = @board.posts.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @board = Board.find(params[:board_id])
    @post = @board.posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @board = Board.find(params[:board_id])
    @post = @board.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(board_post_path(@board,@post), :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @board = Board.find(params[:board_id])
    @post = @board.posts.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(board_post_path(@board,@post), :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @board = Board.find(params[:board_id])
    @post = @board.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(board_posts_path(@board,@post)) }
      format.xml  { head :ok }
    end
  end
end
