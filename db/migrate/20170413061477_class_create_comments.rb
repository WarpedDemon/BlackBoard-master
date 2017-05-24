class ClassCreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :classes_comments do |t|
      t.string :commenter
      t.text :body
      t.references :classes, foreign_key: true

      t.timestamps
    end
  end
end
