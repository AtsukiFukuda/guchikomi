class PostsController < ApplicationController

    before_action :authenticate_user!
    
    def index
        #書き加える部分ここから
      if params[:search] == nil
        @posts= Post.all.order(created_at: "DESC")
      elsif params[:search] == ''
        @posts= Post.all.order(created_at: "DESC")
      else
        #部分検索
        @posts = Post.where("body LIKE ? ",'%' + params[:search] + '%').order(created_at: "DESC")
        .or(Post.where("category LIKE ? ", "%" + params[:search] + "%")).order(created_at: "DESC")
        .or(Post.where("company_name LIKE ? ", "%" + params[:search] + "%")).order(created_at: "DESC")
        .or(Post.where("work_location LIKE ? ", "%" + params[:search] + "%")).order(created_at: "DESC")
        .or(Post.where("salary LIKE ? ", "%" + params[:search] + "%")).order(created_at: "DESC")
        
      end
      #ここまで
    end
   
    
    def new
    #追加箇所
  @post = Post.new
  #ここまで
    end

    #追加箇所
 def create
    @post = Post.new(post_params)

    @post.user_id = current_user.id
  
    #新しい投稿の保存に成功した場合
    if @post.save
      #index.html.erbにページが移る
      redirect_to action: "index"
    #新しい投稿の保存に失敗した場合
    else
      #もう一回投稿画面へ
      redirect_to action: "new"
    end
   end

   def show
    @post = Post.find(params[:id])
    @like = Like.new
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
   #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
   def post_params
    params.require(:post).permit(:body, :category, :company_name, :work_location, :salary)
   end
   
  #ここまで
end
