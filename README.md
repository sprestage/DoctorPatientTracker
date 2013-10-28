Ment or Ship
=======

This is an app that demonstrates the use of the has_many :through association.  A Doctor resource and a Patient resource will be used here.  These resources would be connected through Appointment relationships.


Basic Install
=======
Clone this git repository.
  > clone http://github.com/sprestage/CollaborativeQandA.git

Run the rails server
  > rails s


Implementation
=======
This is a simple rails app, with a pair of resources, Doctors and Patients.  Each doctor has many patients.  Each patient has many doctors.  The Doctors and Patients are connected through Appointments they share.

  > rails _3.2.15_ new DoctorPatientTracker --skip-test-unit

  > cd DoctorPatientTracker

Edit Gemfile for some useful debugging gems

  > bundle

Tuck away RAILS_SECRET from /config/initializer/secret_token.rb to /config/application.yml and add /config/application.yml to .gitignore.
