class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy

  before_save(:titleize_survey)

  validates :name, presence: true

  private
    def titleize_survey
      self.name = self.name.titleize
    end
end
