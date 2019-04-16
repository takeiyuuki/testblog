class Blog < ApplicationRecord
  [:title, :content].each do |v|
    validates v, presence: true, length: { maximum: 140 }
  end
  # validates :title, presence: true, length: { maximum: 140 }
  # validates :content, presence: true, length: { maximum: 140 }
end
