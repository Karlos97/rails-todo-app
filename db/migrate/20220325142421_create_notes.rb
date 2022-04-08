class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title, presence: true, length: { minimum: 1 }
      t.text :body

      t.timestamps
    end
  end
end
