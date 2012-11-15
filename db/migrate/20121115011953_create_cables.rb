class CreateCables < ActiveRecord::Migration
  def change
    create_table :cables do |t|
      t.string :title
      t.text :content
      t.integer :sender_id

      t.timestamps
    end
  end
end
