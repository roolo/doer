class CreateDecisionStatuses < ActiveRecord::Migration
  def self.up
    change_table :users_decisions do |t|
      t.references :decision_status
    end
    
    create_table :decision_statuses do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    remove_column :users_decisions, :decision_status_id
    
    drop_table :decision_statuses
  end
end
