class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.belongs_to :event, foreign_key: true
      t.belongs_to :profile, foreign_key: true

      t.timestamps
    end
  end
end
