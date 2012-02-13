class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :image
      t.string :attachment

      t.timestamps
    end
  end
end
