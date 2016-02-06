class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :parent_id
      t.string :title, :null => false
      t.text :description
      t.boolean :enabled, :default => true
      t.timestamps :null => false
    end
  end
end
