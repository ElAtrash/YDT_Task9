class ChangeLogDateTypeToDateTime < ActiveRecord::Migration[6.0]
  def change
    change_column :logs, :date, :datetime
  end
end
