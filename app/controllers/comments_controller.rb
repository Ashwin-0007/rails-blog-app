class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
        # puts "+=========================================="
        # puts "Comment created at: #{@comment.created_at}"
        @blogpage = Blogpage.find(params[:blogpage_id])
        # puts "+========================================== #{@blogpage.inspect}"
        @comment = @blogpage.comments.new(comment_params)
        puts "+========================================== #{@comment.inspect}"
        
        @comment.user = current_user
        if @comment.save
            #     format.html { redirect_to @blogpage, notice: 'Comment was successfully created.' }
            # end
            #  format.html{redirect_to @blogpage}
            render partial: 'comments/comment', locals: { comment: @comment, blogpage: @blogpage }
            # redirect_to @blogpage
        else
            # flash[:alert] ='Comment has not been created'
            # render partial: 'comments/comment', locals: { comment: @comment, blogpage: @blogpage }
            render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity 
            # format.html{render :new}
            # format.json {render json: @comment.errors, status: :unprocessable_entity}
        end     
    end

    def destroy
        @blogpage = Blogpage.find(params[:blogpage_id])
        @comment = @blogpage.comments.find(params[:id])
        @comment.destroy
        redirect_to @blogpage
    end

    private

    def comment_params
        params.require(:comment).permit(:content,:parent_id)
    end
end
