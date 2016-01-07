require 'pry'
class CommentsController < ApplicationController

  def index
    @comments = Concert.find(params[:concert_id])
  end

  def new
    @concert = Concert.find(params[:concert_id])
    @new_comment = @concert.comments.new
  end

  def create

    @concert = Concert.find(params[:concert_id])
    @comment = @concert.comments.new(strong_params) 

    if @comment.save
      flash[:notice] = 'Comment created successfully!'
      redirect_to(action: 'show', controller: 'comments', concert_id: @concert.id, id: @comment.id)
    else
      # redirect_to action: 'new', controller: 'comments', concert_id: concert.id
      flash[:alert] = 'Comment creation failed!'
      render 'show'
    end
  end

  def show
    @concert = Concert.find(params[:concert_id])
    @comments = @concert.comments
  end

  private
    def strong_params
      params.require(:comment).permit(:comment)
    end

end
