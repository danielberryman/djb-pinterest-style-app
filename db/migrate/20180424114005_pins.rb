class Pins < ActiveRecord::Migration
  def change
  	create_table :pins do |t|
  		t.string :title 
  		t.string :url
  		t.text :text
  		t.string :slug
  		t.string :resource_type
  		t.integer :user_id
  		t.datetime :created_at
  		t.datetime :updated_at
  	end
  end
end
