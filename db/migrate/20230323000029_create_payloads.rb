class CreatePayloads < ActiveRecord::Migration[7.0]
  def change
    create_table :payloads do |t|
      t.string :name
      t.string :ptype
      t.string :designed_by

      t.timestamps
    end
  end
end
