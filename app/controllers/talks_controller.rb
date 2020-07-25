class TalksController < ApplicationController
    before_action :authenticate_user!

    def create
      post = Post.find(params[:post_id])
      @talk = post.talks.build(talk_params)
      @talk.user_id = current_user.id
      if @talk.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end
  
    private
  
      def talk_params
        params.require(:talk).permit(:talk)
      end
end
