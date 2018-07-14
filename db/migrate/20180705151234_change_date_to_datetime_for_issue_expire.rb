class ChangeDateToDatetimeForIssueExpire < ActiveRecord::Migration
  def up
    change_column :tokens, :issue_date, :datetime
    change_column :tokens, :expiration_date, :datetime
  end

  def down
  end
end
