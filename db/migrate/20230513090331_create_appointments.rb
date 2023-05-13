class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :city
      t.string :state
      t.date :date_of_birth
      t.string :phone_no
      t.date :appointment_date
      t.time :appointment_time
      t.integer :doctor_id, null: false

      t.timestamps
    end
  end
end
