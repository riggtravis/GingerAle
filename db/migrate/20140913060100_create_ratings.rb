class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :numeric_rating
      t.string :comments
      t.datetime :date
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
    
    # Create an index on :user_id and :group_id
    add_index :ratings, :user_id
    add_index :ratings, :group_id
  end
end
