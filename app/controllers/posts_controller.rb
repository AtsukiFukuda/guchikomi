class PostsController < ApplicationController

    before_action :authenticate_user!
    
  def index
    @like_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    @cheer_ranks = Post.find(Cheer.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    if params[:search] == nil
        @posts= Post.all.order(created_at: "DESC")
      elsif params[:search] == ''
        @posts= Post.all.order(created_at: "DESC")
      else
        @posts = Post.where("body LIKE ? ",'%' + params[:search] + '%')
        .or(Post.where("company_name LIKE ? ", "%" + params[:search] + "%"))
        .or(Post.where("category LIKE ? ", "%" + params[:search] + "%"))
        .or(Post.where("title LIKE ? ", "%" + params[:search] + "%"))  
      end
  end
     
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    @cheer = Cheer.new
    @forget = Forget.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to :action => "show", :id => @post.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to action: :index
  end
  
   private
   def post_params
    params.require(:post).permit(:title, :body, :category, :company_name, :work_location, :salary, :overall)
   end
   
end
