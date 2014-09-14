class CreateCourses < ActiveRecord::Migration
  def change
     create_table :courses do |t|
      t.string :name
      t.string :term
      t.string :subject
      t.integer :listing
      t.integer :user_id

      t.timestamps
    end
    
    # Create a foreign key on :user_id
    add_index :courses, :user_id
  end
end
