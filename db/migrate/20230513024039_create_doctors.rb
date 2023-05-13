class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.text :description
      t.string :speciality
      t.integer :experience
      t.string :phone_no

      t.timestamps
    end
  end
end
