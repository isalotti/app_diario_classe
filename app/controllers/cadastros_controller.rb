class CadastrosController < ApplicationController
    
    helper CadastroHelper  

    def index
      @cadastros = User.all
    end
    def show
      @cadastro = User.find(params[:id])
    end

    def new
      @cadastro = User.new
    end

    def edit
      @cadastro = User.find(params[:id])
    end

    def create
        @cadastro = User.new(cadastro_params)
        
        puts "----- entra cadastro.save #{@cadastro}"
        @cadastro.save
        if @cadastro.save
            redirect_to cadastros_path
            puts "-----cadastro.save"
          else
            puts "-----nao salvou"
            render :new
        end
    end

    def update
      puts "----- entra update.save #{@cadastro}"
      @cadastro = User.find(params[:id]) 
       puts "-------update  #{@cadastro}"
      if @cadastro.update(cadastro_params)
        redirect_to cadastros_path
        puts "--------cadastro.update"
      else
        puts "--------cdastro nao editou!"
        render :edit
      end 

    end

    def destroy
        @cadastro = User.find(params[:id])
        puts "---destroy id #{@cadastro.id}"
        @cadastro.destroy

        redirect_to cadastros_path
    end
  

    private

    #Usuários administradores realizam cadastro
    def cadastro_params
      params.require(:user).permit(:email, :matricula, :nome , :password , :tipo)
    end
    
end
