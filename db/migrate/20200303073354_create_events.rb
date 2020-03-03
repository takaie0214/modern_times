class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :summary
      t.datetime :dtstart
      t.datetime :dtend
      t.text :description

      t.timestamps
    end
  end
end
