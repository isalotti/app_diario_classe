class CreateCadastros < ActiveRecord::Migration[6.0]
  def change
    create_table :cadastros do |t|

      t.timestamps
    end
  end
end
