class RemoveMatriculaFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :matricula, :string
  end
end
