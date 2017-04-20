class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :city
      t.text :skills
      t.string :portfolio
      t.belongs_to :city, foreign_key: true
      t.belongs_to :account, foreign_key: true
      
      t.timestamps
    end
  end
end
