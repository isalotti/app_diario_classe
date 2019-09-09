class CadastrosController < ApplicationController
    
    def index
      @cadastros = User.all
      puts "-index"
    end
    def show
      #TODO: verificar route deveria ir p/ index!
    end

    def new
      @cadastro = User.new
    end

    def edit
      @cadastro = User.find(params[:id])
    end

    def create
        @cadastro = User.new(params[:cadastro])

        @cadastro.save
        
        if @cadastro.save
            redirect_to @cadastro
          else
            render :new
        end
    end

    def update
      @cadastro = User.find(params[:id]) 

      if @cadastro.update(cadastro_params_adm)
        redirect_to @cadastro
      else
        render :edit
      end 

    end

    def destroy
        @cadastro = User.find(params[:id])

        @cadastro.destroy

        redirect_to cadastros_path
    end
    


    private

    #Usuários administradores realizam cadastro
    def cadastro_params_adm
      params.require(:cadastro).permit(:email, :tipo, :matricula, :nome)
    end
    
end
