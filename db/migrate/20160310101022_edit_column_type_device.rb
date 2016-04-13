class EditColumnTypeDevice < ActiveRecord::Migration
  def change
  	change_table :devices do |t|
  	  t.remove :type
  	  t.string :model
    end
  end
end
