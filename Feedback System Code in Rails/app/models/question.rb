class Question < ApplicationRecord
  belongs_to :survey
  validates :text, presence: true
end
