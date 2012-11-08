class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :code_name
      t.string :email
      t.string :github

      t.string :password_hash
      t.string :password_salt


      t.timestamps
    end
  end
end
