class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :applianceId
      t.string :manufacturerName
      t.string :modelName
      t.string :version
      t.string :friendlyName
      t.string :friendlyDescription
      t.string :isReachable
      t.string :photonId

      t.timestamps null: false
    end
  end
end
