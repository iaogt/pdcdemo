class CreatePedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :pedidos do |t|
      t.string :cliente
      t.float :total
      t.datetime :fecha

      t.timestamps
    end
  end
end
