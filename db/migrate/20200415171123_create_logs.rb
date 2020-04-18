class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.integer :user_id
      t.string :login
      t.string :type
      t.date :date
    end
  end
end
