class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.integer :topic_id
      t.string :website
      t.belongs_to :organizer, foreign_key: true
      t.datetime :submission_deadline
      t.text :presenters
      t.text :address
      t.text :perks
      t.string :cost
      t.datetime :submission_sales_date
      t.datetime :ticket_sales_date
      t.belongs_to :city, foreign_key: true

      t.timestamps
    end
  end
end
