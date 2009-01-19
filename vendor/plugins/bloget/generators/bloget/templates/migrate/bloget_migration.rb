class BlogetMigration < ActiveRecord::Migration
  def self.up
    create_table :bloggers do |t|
      t.column :poster_id, :integer, :null => false
      t.column :poster_type, :string, :null => false
      t.timestamps 
    end
    
    add_index :bloggers, [:poster_id, :poster_type], :unique => true

    create_table :posts do |t|
      t.string :permalink, :null => false, :unique => true
      t.integer :poster_id, :null => false
      t.string :poster_type, :null => false
      t.string :title, :null => false
      t.text :content, :null => false
      t.string :state, :null => false, :default => 'draft'
      t.timestamps 
    end

    create_table :comments do |t|
      t.column :post_id, :integer, :null => false
      t.column :poster_id, :integer, :null => false
      t.column :poster_type, :string, :null => false
      t.column :content, :text, :null => false
      t.timestamps 
    end
  end

  def self.down
    drop_table :comments
    drop_table :posts
    drop_table :bloggers
  end
end
