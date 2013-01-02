class SmallFixPlural < ActiveRecord::Migration
  def change
  	rename_table :ftts_results, :ftt_results
  	rename_table :tmts_results, :tmt_results
  end
end
