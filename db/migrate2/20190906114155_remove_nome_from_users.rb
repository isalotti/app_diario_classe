class RemoveNomeFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :nome, :string
  end
end
