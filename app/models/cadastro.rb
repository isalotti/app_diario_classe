class Cadastro < ApplicationRecord
    validates  :matricula , :email,  :nome, :tipo ,:password, presence : true
end
