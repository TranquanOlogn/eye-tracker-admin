class CreateDevices < ActiveRecord::Migration[7.2]
  def change
    create_table :devices do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
