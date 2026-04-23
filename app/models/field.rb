class Field < ApplicationRecord
  belongs_to :agent, class_name: 'User', optional: true
  has_many :updates, dependent: :destroy
  
  enum :current_stage, { planted: 0, growing: 1, ready: 2, harvested: 3 }
  
  validates :name, :crop_type, :planting_date, presence: true
  
  def computed_status
    return 'Completed' if ready? || harvested?
    
    days_since_planting = (Date.current - planting_date).to_i
    last_update = updates.order(created_at: :desc).first
    days_since_update = last_update ? (Date.current - last_update.created_at.to_date).to_i : days_since_planting
    
    if days_since_update > 14
      'At Risk'
    elsif planted? && days_since_planting > 30
      'At Risk'
    else
      'Active'
    end
  end
  
  def status_badge_class
    case computed_status
    when 'Active'
      'bg-green-100 text-green-800'
    when 'At Risk'
      'bg-yellow-100 text-yellow-800'
    when 'Completed'
      'bg-gray-100 text-gray-800'
    end
  end
end
