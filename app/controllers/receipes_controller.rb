class ReceipesController < ApplicationController
    before_action :set_receipe, only: [:like, :edit, :update, :show]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only:  [:edit, :update]
    
    def index
        @receipes = Receipe.paginate(page: params[:page], per_page:4)
    end

    def show
        
    end
   
    def new
        @receipe = Receipe.new
    end
   
    def create
        @receipe = Receipe.new(receipe_params)
        @receipe.chef = current_user
        
        if @receipe.save
            flash[:success] = "Your receipe was created successfully!"
            redirect_to receipes_path
        else
            render :new
        end
    end
    
    
    def edit
    end
    
    def update
        if @receipe.update(receipe_params)
            flash[:success] = "Your receipe was updated successfully!"
            redirect_to receipe_path(@receipe)
        else
            render :edit
        end
    end
    
    def like
        like = Like.create(like: params[:like], chef: current_user, receipe: @receipe)
        if like.valid?
            flash[:success] = "Your selection was successful"
            redirect_to :back
        else
            flash[:danger] = "Your can Like/dislike a receipe only once!"
            redirect_to :back
        end
    end
    
    private 
    
        def receipe_params
            params.require(:receipe).permit(:name,:summary,:description, :picture)
        end
        
        def set_receipe
            @receipe = Receipe.find(params[:id])
        end
        
        def require_same_user
            if current_user != @receipe.chef
                flash[:danger] = "You can only edit your own receipes"
                redirect_to receipe_path
            end
        end
        
       
    
end
