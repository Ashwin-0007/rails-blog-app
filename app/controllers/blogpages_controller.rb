class BlogpagesController < ApplicationController
    before_action :find_blogpage, only: [:edit, :show, :update, :destroy]
    def index
        @blogpages = Blogpage.all
        # @blogpages = current_user.blogpages
    end

    def new
        @blogpage = Blogpage.new
    end

    def create
        @blogpage = Blogpage.new(blogpage_params)
        @blogpage.user_id = current_user.id

        if @blogpage.save
            redirect_to @blogpage
        else 
           render :new
        end       
    end

    def edit
        @blogpage= Blogpage.find(params[:id])
        @blogpage.user_id = current_user.id
    end

    def show
        @blogpage= Blogpage.find(params[:id]) 
        @comments = @blogpage.comments.order(created_at: :desc)
    end
    
     
    def update
        @blogpage= Blogpage.find(params[:id])
        if @blogpage.update(blogpage_params)
            redirect_to @blogpage
        else 
            render :edit
            
        end

    end    

    def destroy
        @blogpage= Blogpage.find(params[:id])
        @blogpage.destroy
        redirect_to blogpages_path
    end 
    def user_blog
        # @blogpage= Blogpage.find(params[:id])
        # @blogpage_currents = current_user.blogpages
        @user_blogpages = current_user.blogpages
    end
    
    private

    def find_blogpage
        @blogpage = Blogpage.find(params[:id])
        # Ensure that the current user is the owner of the blogpage
    end
    def blogpage_params
        params.require(:blogpage).permit(:title, :author, :content, :avatar)
    end

end
