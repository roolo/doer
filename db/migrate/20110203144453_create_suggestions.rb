class CreateSuggestions < ActiveRecord::Migration
  def self.up
    create_table :suggestions do |t|
      t.string :name
      t.references :user
      t.boolean :active, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :suggestions
  end
end
