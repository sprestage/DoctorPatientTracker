class Appointment < ActiveRecord::Base
  attr_accessible :day_and_time, :doctor, :patient
  belongs_to :doctor
  belongs_to :patient
end
