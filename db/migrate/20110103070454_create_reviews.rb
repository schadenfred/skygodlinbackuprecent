class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.string :content
      t.string :category
      t.integer :user_id
      t.integer :reviewer_id, class => :user

      t.timestamps
    end
    add_index :reviews, :user_id
  end

  def self.down
    drop_table :reviews
  end
end

