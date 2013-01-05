class RenameTestsToEvaluationTests < ActiveRecord::Migration
  def up
    rename_table :tests, :evaluation_tests
  end

  def down
        rename_table :evaluation_tests, :tests
  end
end
