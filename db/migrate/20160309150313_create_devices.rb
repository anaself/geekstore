class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.belongs_to :user, index: true
      t.string :mac_adress
      t.string :operating_system
      t.string :type
      t.timestamps null: false
    end
  end
end
