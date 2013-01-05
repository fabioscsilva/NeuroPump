class AppointmentPlansController < ApplicationController
  def index
    #fazer o da sessão que queremos
    appoint_id = 1
    # 
    
    test = nil
    appoint_plan = nil
    
    if(!session["test_sequence"].blank?)
       appoint_plan = session["test_sequence"] 
    else   
       appoint_plan = AppointmentPlan.where(:appointment_id => appoint_id)
    end
    
      test = appoint_plan[0].evaluation_test
      
      if(appoint_plan.size == 1)     
          session["test_sequence"] = nil
      else
          i = 1
          size = appoint_plan.size - 1 
          
          tests = Array.new
          while i <= size  do #enquanto houver testes por fazer...
             tests << appoint_plan[i]
             i = i + 1
          end
          session["test_sequence"] = tests
      end
      #verificar para qual teste enviar
      if test != nil
         if test.name == "WMS"
           redirect_to new_wms_result_path
         end
         if test.name == "WAIS"
           redirect_to new_wais_result_path
         end
         if test.name == "Relogio"
           redirect_to new_clock_result_path
         end
         if test.name == "FTT"
           redirect_to new_ftt_result_path
         end
         if test.name == "TMT"
           redirect_to new_tmt_result_path
         end
      else
          redirect_to appointments_path
      end  

  end
end
