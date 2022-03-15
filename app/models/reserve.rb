class Reserve < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :financial_planner, optional: true

  TIME_ZONE = [
      '10:00 ~ 10:30',
      '10:30 ~ 11:00',
      '11:00 ~ 11:30',
      '11:30 ~ 12:00',
      '12:00 ~ 12:30',
      '12:30 ~ 13:00',
      '13:00 ~ 13:30',
      '13:30 ~ 14:00',
      '14:00 ~ 14:30',
      '14:30 ~ 15:00',
      '15:00 ~ 15:30',
      '15:30 ~ 16:00',
      '16:00 ~ 16:30',
      '16:30 ~ 17:00',
      '17:00 ~ 17:30',
      '17:30 ~ 18:00'
    ].freeze
    
  def time_zone_value
    TIME_ZONE[self.age]
  end
end
