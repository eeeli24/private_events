class Event < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User'
  has_many :attendances, :foreign_key => :attended_event_id
  has_many :attendees, :through => :attendances, :source => :attendee

  scope :upcoming, -> { where('date > ?', Time.now).order('date ASC') }
  scope :past, -> { where('date < ?', Time.now).order('date DESC') }
end
