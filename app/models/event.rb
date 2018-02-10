class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'#, foreign_key: 'user_id'
  has_and_belongs_to_many :attendees, class_name: 'User'

  validates :description, presence: true, length: { minimum: 6 }
  validates :date, presence: true
  validates :place, presence: true

# Vu sur l'url: https://apidock.com/rails/ActiveRecord/NamedScope/ClassMethods/scope
  scope :current, -> {where("date > ?", DateTime.now)}
  scope :past, -> {where("date < ?", DateTime.now)}
end
