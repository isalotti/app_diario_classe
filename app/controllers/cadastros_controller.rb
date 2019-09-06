class CadastrosController < ApplicationController
    
  
    def show
    end

    def new
        
    end

    def create
        @cadastro = User.new(params[:cadastro])

        @cadastro.save
        
        if @cadastro.save
            redirect_to @cadastro
          else
            render 'new'
          end
    end

    def edit
        @cadastro = User.find(params[:id])
    end
    
end
