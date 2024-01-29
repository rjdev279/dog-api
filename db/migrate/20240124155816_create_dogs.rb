class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :breed, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
