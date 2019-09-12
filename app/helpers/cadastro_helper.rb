module CadastroHelper
    #Métodos para fazer visível a variável resource_name do Devise no módulo de Cadastro
    def resource_name
        :user
    end

    def resource
        @resource ||= User.new
    end

    def devise_mapping
        @devise_mapping ||=Devise.mappings[:user]
    end
end
