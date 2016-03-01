class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :experience
      t.string :location

      t.timestamps null: false
    end
  end
end
