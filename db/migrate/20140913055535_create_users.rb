class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :phone
      t.string :street
      t.integer :aptpo
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
