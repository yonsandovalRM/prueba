class CreateSeats < ActiveRecord::Migration[5.0]
  def change
    create_table :seats do |t|
      t.string :name
      t.string :typed
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
