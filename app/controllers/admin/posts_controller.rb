class Admin::PostsController < ApplicationController
  
  layout 'admin'
  
  before_filter :require_is_admin
  

  # GET /posts/1/edit
  def edit
    @board = Board.find(params[:board_id])
    @post = Post.find(params[:id])
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @board = Board.find(params[:board_id])
    @post = Post.find(params[:id])
    
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to board_post_path(@board,@post), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @board = Board.find(params[:board_id])
     @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(board_posts_path(@board,@post)) }
      format.json { head :no_content }
    end
  end
end
