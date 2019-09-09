class Cadastro < ApplicationRecord
    validates  :matricula , :email,  :nome, :tipo , presence : true
end
