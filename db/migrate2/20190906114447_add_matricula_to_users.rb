class AddMatriculaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :matricula, :string
    add_index :users, :matricula, unique: true
  end
end
