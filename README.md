DoctorPatientTracker (aka Ment or Ship)
=======

This is an app that demonstrates the use of the has_many :through association.  A Doctor resource and a Patient resource will be used here.  These resources would be connected through Appointment relationships.

[![Code Climate](https://codeclimate.com/github/sprestage/DoctorPatientTracker.png)](https://codeclimate.com/github/sprestage/DoctorPatientTracker)


Basic Install
=======
Clone this git repository.
<pre>
  $ clone http://github.com/sprestage/DoctorPatientTracker.git
</pre>

Run the rails server
<pre>
  $ rails s
</pre>


Implementation
=======
This section is quite boring and pedantic.  I've written it out because
that was part of my learning process and I find it useful to refer back
to, so feel free to skip.

## First, do all the easy stuff
### Create basic rails app
This is a simple rails app, with a pair of resources, Doctors and Patients.
Each doctor has many patients.  Each patient has many doctors.  The Doctors
and Patients are connected through Appointments they share.
<pre>
  $ rails \_3.2.15\_ new DoctorPatientTracker --skip-test-unit

  $ cd DoctorPatientTracker
</pre>

Edit Gemfile for some useful debugging gems.  Then run bundler
<pre>
  $ bundle
</pre>

Tuck away RAILS_SECRET from /config/initializer/secret_token.rb to /config/application.yml and add /config/application.yml to .gitignore.

Add a home page, /app/views/home/index.html.erb
Add a home controller, /app/controllers/home_controller.rb
Add a default route to /config/routes.rb
  root :to => 'home#index'

Check everything in so we have this default rails app set in stone.  :)

### Create scaffolding for Doctor resource
Create the scaffold for the new resource, Doctor.
<pre>
  $ rails g scaffold Doctor name:string --no-test-framework --no-assets --no-stylesheets --no-scss
</pre>

### Migrate Doctors into the DB
Migrate the database to pick up the changes.
<pre>
  $ rake db:migrate
</pre>

### Set up the Doctor tests
I know I should probably create all the tests first, but I feel so lost
without the stuff there first, ya know.

Create the tests using generate, then completely replace what is in the files.
<pre>
  $ rails g mini_test:feature DoctorShowIndex
  $ rails g mini_test:feature DoctorShow
  $ rails g mini_test:feature DoctorCreate
  $ rails g mini_test:feature DoctorUpdate
  $ rails g mini_test:feature DoctorDelete
</pre>

Add /test/ folder.  Add /test/doctors/ folder.  Move doctor tests. Then
add fixture support to /test/test_helper.rb

### Set up the Doctor views
Add Doctor name to display on /doctors/new page

Edit all the 5 /views/doctors/*.html.erb to display the fields from the
models.

Ok, all Doctor stuff works. Time to implement Patients:

### Create scaffolding for Patient resource
<pre>
  $ rails g scaffold Patient name:string --no-test-framework --no-assets --no-stylesheets --no-scss
</pre>

### Set up the Patient tests
Then create the Patient tests:
<pre>
  $ rails g mini_test:feature PatientShowIndex
  $ rails g mini_test:feature PatientShow
  $ rails g mini_test:feature PatientCreate
  $ rails g mini_test:feature ItemUpdate
  $ rails g mini_test:feature ItemDelete
</pre>

Add /test/patients/ folder.  Move patient tests.

### Migrate Patients into the DB
Add Patients to the DB:
<pre>
  $ rake db:migrate
</pre>

### Set up the Patient views
Add Patient name to display on /patients/new page

Edit all the 5 /views/patients/*.html.erb to display the fields from the
models.

### Run the tests
Tests all green?  Time to implement...THE ASSIGNMENT


## Implement the assignment
### Add third resource, Appointments
Ahhhh.  I need the third resource that doctors and patients all associate through: Appointments!
<pre>
  $ rails g scaffold Appointment day_and_time:datetime --no-test-framework --no-assets --no-stylesheets --no-scss
</pre>

### Add doctors/patients to new/edit/show appointments
Skipping TDD for now.  Checking BDD.  Looks good, but...need to have
doctors and patients be included in the create/update/show
appointment pages.

Added dropdown of existing doctors on the New appointment page.  Whoops,
need to add one of patients, since this is the New Appointment page.

### Modify appointments_controller
Ok, now edit the appointments_controller, right?

Modified the create and update methods in the appointments_controller.
This should all be configured correctly.

Needed to correct some parameters and get my hashing right.  It all
works now.  Yeay!!!


Time formatting
=======

The appointments index had a terrible format to the date and really wanted
to be corrected.  RailsCast #31 was used as a starting point.  Also used:
<pre>
  ri strftime
</pre>

Here is a picture of the improvement...

![Image](https://s3-us-west-2.amazonaws.com/sprestage/DoctorPatientTracker_date_formatting.png?raw=true)

