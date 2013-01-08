class TestConstraints < ActiveRecord::Migration
  def change



      	execute <<-SQL
      ALTER TABLE clock_results ADD CONSTRAINT fk_clock_results_appointment_plans FOREIGN KEY (appointment_plan_id) REFERENCES appointment_plans(id)
    SQL
   

          execute <<-SQL
      ALTER TABLE ftt_results ADD CONSTRAINT fk_ftt_results_appointment_plans FOREIGN KEY (appointment_plan_id) REFERENCES appointment_plans(id)
    SQL
   

      	execute <<-SQL
      ALTER TABLE tmt_results ADD CONSTRAINT fk_tmt_results_appointment_plans FOREIGN KEY (appointment_plan_id) REFERENCES appointment_plans(id)
    SQL
   

        execute <<-SQL
      ALTER TABLE wais_results ADD CONSTRAINT fk_wais_results_appointment_plans FOREIGN KEY (appointment_plan_id) REFERENCES appointment_plans(id)
    SQL
   
      	execute <<-SQL
      ALTER TABLE wms_results ADD CONSTRAINT fk_wms_results_appointment_plans FOREIGN KEY (appointment_plan_id) REFERENCES appointment_plans(id)
    SQL
   

  end
end
