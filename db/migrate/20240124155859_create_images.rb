class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.references :dog, null: false, foreign_key: true
      t.string :url, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
