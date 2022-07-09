class TdCategory < ApplicationRecord
    belongs_to :td_list
    has_many :td_list_items
end
