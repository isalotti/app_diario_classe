class AddTipoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tipo, :integer
  end
end
