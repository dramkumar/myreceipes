class ReceipesController < ApplicationController
    
    def index
        @receipes = Receipe.paginate(page: params[:page], per_page:4)
    end

    def show
        @receipe = Receipe.find(params[:id])
    end
   
    def new
        @receipe = Receipe.new
    end
   
    def create
        @receipe = Receipe.new(receipe_params)
        @receipe.chef = Chef.find(2)
        
        if @receipe.save
            flash[:success] = "Your receipe was created successfully!"
            redirect_to receipes_path
        else
            render :new
        end
    end
    
    
    def edit
        @receipe = Receipe.find(params[:id])
    end
    
    def update
        @receipe = Receipe.find(params[:id])
         if @receipe.update(receipe_params)
            flash[:success] = "Your receipe was updated successfully!"
            redirect_to receipe_path(@receipe)
        else
            render :edit
        end
    end
    
    def like
        @receipe = Receipe.find(params[:id])
        like = Like.create(like: params[:like], chef: Chef.find(2), receipe: @receipe)
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
    
end
