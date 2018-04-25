class AddAvatarColumnToPins < ActiveRecord::Migration
  def up
  	 add_attachment :pins, :avatar
  end
  def down
  	 remove_attachment :pins, :avatar
  end
end
