class CreateNeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :needs do |t|
      t.integer :userID
      t.string :title
      t.string :description
      t.string :needType
      t.float :lat
      t.float :lng
      t.string :formattedAddress
      t.string :status

      t.timestamps
    end
  end
end
