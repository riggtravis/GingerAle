class CreateRoster
  def change
    create_table :roster do |t|
      t.integer :user_id
      t.integer :group_id
    end
    
    # Create indexes on both user_id and group_id
    add_index :rosters, :user_id
    add_index :rosters, :group_id
  end
end