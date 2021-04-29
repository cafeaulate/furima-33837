class AddPrefuctureIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :prefucture_id, :integer , null: false
  end 
end
