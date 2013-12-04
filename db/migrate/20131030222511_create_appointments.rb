class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.timestamps
    end

    create_table :patients do |t|
      t.string :name
      t.timestamps
    end

    create_table :appointments do |t|
      t.belongs_to :doctor
      t.belongs_to :patient
      t.datetime :day_and_time

      t.timestamps
    end

    add_index :appointments, :doctor_id
    add_index :appointments, :patient_id
  end
end


