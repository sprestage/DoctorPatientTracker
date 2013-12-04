Ment or Ship
=======

This is an app that demonstrates the use of the has_many :through association.  A Doctor resource and a Patient resource will be used here.  These resources would be connected through Appointment relationships.


Basic Install
=======
Clone this git repository.
  > clone http://github.com/sprestage/DoctorPatientTracker.git

Run the rails server
  > rails s


Implementation
=======
This is a simple rails app, with a pair of resources, Doctors and Patients.  Each doctor has many patients.  Each patient has many doctors.  The Doctors and Patients are connected through Appointments they share.
  > rails \_3.2.15\_ new DoctorPatientTracker --skip-test-unit

  > cd DoctorPatientTracker

Edit Gemfile for some useful debugging gems.  Then run bundler
  > bundle

Tuck away RAILS_SECRET from /config/initializer/secret_token.rb to /config/application.yml and add /config/application.yml to .gitignore.

Add a home page, /app/views/home/index.html.erb
Add a home controller, /app/controllers/home_controller.rb
Add a default route to /config/routes.rb
  root :to => 'home#index'

Check everything in so we have this default rails app set in stone.  :)

Create the scaffold for the new resource, Doctor.
  > rails g scaffold Doctor name:string --no-test-framework --no-assets --no-stylesheets --no-scss

Migrate the database to pick up the changes.
  > rake db:migrate

I know I should probably create all the tests first, but I feel so lost without the stuff there first, ya know.

Create the tests using generate, then completely replace what is in the files.
  > rails g mini_test:feature DoctorShowIndex

  > rails g mini_test:feature DoctorShow

  > rails g mini_test:feature DoctorCreate

  > rails g mini_test:feature DoctorUpdate

  > rails g mini_test:feature DoctorDelete

Add /test/ folder.  Add /test/doctors/ folder.  Move doctor tests. Then add fixture support to /test/test_helper.rb

Add Doctor name to display on /doctors/new page

Edit all the 5 /views/doctors/*.html.erb to display the fields from the models.

Ok, all Doctor stuff works. Time to implement Patients:
  > rails g scaffold Patient name:string --no-test-framework --no-assets --no-stylesheets --no-scss

Then create the Patient tests:
  > rails g mini_test:feature PatientShowIndex

  > rails g mini_test:feature PatientShow

  > rails g mini_test:feature PatientCreate

  > rails g mini_test:feature ItemUpdate

  > rails g mini_test:feature ItemDelete

Add /test/patients/ folder.  Move patient tests.

Add Patients to the DB:
  > rake db:migrate

Add Patient name to display on /patients/new page

Edit all the 5 /views/patients/*.html.erb to display the fields from the models.

Tests all green?  Time to implement...THE ASSIGNMENT

Ahhhh.  I need the third resource that doctors and patients all associate through: Appointments!
  > rails g scaffold Appointment day_and_time:datetime --no-test-framework --no-assets --no-stylesheets --no-scss

Skipping TDD for now.  Checking BDD.  Looks good, but...need to have doctors and patients be
included in the create/update/show/delete appointment pages.

/views/doctors/_form.html.erb
<div> class="field">
  <% Patient.all.each do |patient| %>
    <%= check_box_tag "doctor[patient_ids][]", patient.id %>
    <%= patient.name %><br/>
  <% end %>
</div>


