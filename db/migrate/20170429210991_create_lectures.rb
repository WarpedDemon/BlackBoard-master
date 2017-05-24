
class CreateLectures < ActiveRecord::Migration[5.0]
  def change
    create_table :lectures do |t|
      t.string :title
      t.text :text
      t.string :timeSlot
      t.text :roomNum

      t.timestamps
    end
  end
end
