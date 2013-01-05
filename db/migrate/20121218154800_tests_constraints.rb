class TestsConstraints < ActiveRecord::Migration
   def change

  	
  	execute <<-SQL
      ALTER TABLE tests ADD CONSTRAINT fk_tests_test_areas FOREIGN KEY (test_area_id) REFERENCES test_areas(id)
    SQL
   

  end
end
