class ForgetsController < ApplicationController
    def create
        @forget = current_user.forgets.create(post_id: params[:post_id])
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        @forget = Forget.find_by(post_id: params[:post_id], user_id: current_user.id)
        @forget.destroy
        redirect_back(fallback_location: root_path)
      end
end
