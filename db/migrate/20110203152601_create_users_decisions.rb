class CreateUsersDecisions < ActiveRecord::Migration
  def self.up
    create_table :users_decisions do |t|
      t.references :user, :null => false
      t.references :suggestion, :null => false
      t.references :decision, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :users_decisions
  end
end
