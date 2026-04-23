class User < ApplicationRecord
  has_secure_password
  
  enum :role, { agent: 0, admin: 1 }
  
  has_many :fields, foreign_key: 'agent_id'
  has_many :updates, through: :fields
  
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
