class CreateAuthentifications < ActiveRecord::Migration
  def change
    create_table :authentifications do |t|
      t.json :local
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
