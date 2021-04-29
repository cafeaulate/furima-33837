class AddSpanIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :span_id, :integer , null: false
  end
end
