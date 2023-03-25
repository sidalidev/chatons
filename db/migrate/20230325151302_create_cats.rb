class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :race
      t.integer :age
      t.string :image_url

      t.timestamps
    end
  end
end
