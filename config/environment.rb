# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
DoctorPatientTracker::Application.initialize!

Time::DATE_FORMATS[:appointment_time] = "%B %-d at %l:%M %p"
