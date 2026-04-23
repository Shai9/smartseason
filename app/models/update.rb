class Update < ApplicationRecord
  belongs_to :field
  
  enum :stage, { planted: 0, growing: 1, ready: 2, harvested: 3 }
  
  validates :stage, presence: true
  validates :notes, length: { maximum: 500 }
  
  after_create :update_field_stage
  
  private
  
  def update_field_stage
    field.update(current_stage: stage)
  end
end
