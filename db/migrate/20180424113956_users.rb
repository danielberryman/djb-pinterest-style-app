class Users < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  	  t.string :username
  	  t.string :email
  	  t.string :password_digest
  	  t.datetime :created_at
  	  t.datetime :updated_at	  
  	end
  end
end
