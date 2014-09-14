class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
    
    # Create an index on :user_id and :course_id
    add_index :groups, :user_id
    add_index :groups, :course_id
  end
end
