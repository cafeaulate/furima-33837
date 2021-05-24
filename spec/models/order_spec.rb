require 'rails_helper'

RSpec.describe Order, type: :model do
  t.references :user, null: false, foreign_key: true
  t.references :item, null: false, foreign_key: true
end
