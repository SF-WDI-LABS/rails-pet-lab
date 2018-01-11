class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :time
      t.string :reason
      t.string :veterinarian
      t.references :pet, foreign_key: true

      t.timestamps
    end
  end
end
