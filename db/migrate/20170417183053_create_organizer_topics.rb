class CreateOrganizerTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :organizer_topics do |t|
      t.belongs_to :topic, foreign_key: true
      t.belongs_to :organizer, foreign_key: true

      t.timestamps
    end
  end
end
