class CreateTables < ActiveRecord::Migration
  def change
    create_table :posts do |table|
      table.string :title
      table.string :content
      table.integer :user_id
      table.timestamps
    end

    create_table :users do |table|
      table.string :username
      table.string :password
      table.boolean :logged_in
      table.timestamps
    end

    create_table :tags do |table|
      table.string :tag
      table.integer :post_id
      table.timestamps
    end
  end
end