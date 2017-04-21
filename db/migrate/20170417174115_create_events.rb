class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.string :website
      t.text :address
      t.text :perks
      t.string :cost
      t.belongs_to :organizer, foreign_key: true
      t.belongs_to :city, foreign_key: true
      t.belongs_to :topic, foreign_key: true
      t.timestamps
    end
  end
end
