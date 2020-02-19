class CreateFulfillments < ActiveRecord::Migration[6.0]
  def change
    create_table :fulfillments do |t|
      t.integer :helperID
      t.integer :needID

      t.timestamps
    end
  end
end
