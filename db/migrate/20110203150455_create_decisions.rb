class CreateDecisions < ActiveRecord::Migration
  def self.up
    create_table :decisions do |t|
      t.string :name,      :null => false
      t.text :description
      t.boolean :active,   :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :decisions
  end
end
