class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions


  belongs_to :user
  has_one :purchase_history

end
