# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Implemented by Fábio Silva - 06/12/2012
EvaluationTest.delete_all
TestArea.delete_all
Appointment.delete_all
AppointmentStatus.delete_all
AppointmentType.delete_all
Neuropsychologist.delete_all
Secretary.delete_all
Manager.delete_all
Patient.delete_all
Clinic.delete_all
Administrator.delete_all
Gender.delete_all
Role.delete_all
Login.delete_all
Handedness.delete_all
CivilStatus.delete_all



#Civil_Statuses
statuses = CivilStatus.create([{description:'Solteiro'},{description: 'Casado'}, {description: 'Divorciado'}, {description: 'Viuvo'}])
st1 = statuses.first.id

#Handedness
hand = Handedness.create([{description: 'Destro'}, {description: 'Esquerdino'}])
h1 = hand.first.id

#Genders
genders = Gender.create([{description:'Feminino'}, {description:'Masculino'}, {description: 'Outro'}])
female = genders.first.id
male = genders.second.id


#Logins
logins = Login.create([{email:'smr@fpce.uc.pt', password:'qwerty'},
                      {email:'sus.antunes@ipnp.pt', password:'qwerty'},
                      {email:'fabioscsilva@gmail.pt', password:'qwerty'},
                       {email:'srodrigues14@gmail.pt', password:'qwerty'},
                        {email:'brunomiguelas@gmail.pt', password:'qwerty'},
                        {email:'manager@gmail.com', password:'qwerty'},
                        {email:'fabio@neuropump.com', password:'qwerty'},
                        {email:'BLFPortela@gmail.com', password:'qwerty'},
                        {email:'ruipereir@gmail.com', password:'qwerty'}])
login1 = logins.first.id
login2 = logins.second.id
login3 = logins.third.id
login4 = logins.fourth.id
login5 = logins.fifth.id
login6 = logins[5].id
login7 = logins[6].id
login8 = logins[7].id
login9 = logins[8].id

#Admin
admins = Administrator.create([{name:'Admin1', login_id: login7, address:'Braga - UMinho', telephone:'222333444', mobilephone:'912333444', active:'true'}])
admin = admins.first.id

#Clinics
clinics = Clinic.create([{name:'Instituto de psicologia e neuropsicologia do porto', address:'Porto',fiscal_number:'321456712', email:'geral@ipnp.pt', telephone:'232444111', active:'true', administrator_id: admin}])
clinic1 = clinics.first.id

#Neuropsychologists
neuropsychologists = Neuropsychologist.create([{name:'Mario Rodrigues Simoes', address:'Rua das Fontainhas, Coimbra', telephone:'223421566', mobilephone:'923214007', date_of_birth:'09/12/1960', identification_code:'981324214', active:'true', gender_id: male, clinic_id: clinic1, login_id: login1},
                                               {name:'Susana Amaral Antunes', address:'Rua das Flores, Porto', telephone:'223421566', mobilephone:'915226087', date_of_birth:'10/11/1987', identification_code:'981324214', active:'true', gender_id: female, clinic_id: clinic1, login_id: login2},
                                               {name:'Fabio Samuel Coelho da Silva', address:'Rua Tomas Pimenta, Porto', telephone:'224224252', mobilephone:'913264006', date_of_birth:'04/07/1980', identification_code:'981324214', active:'true', gender_id: male, clinic_id: clinic1, login_id: login3}])

neuro1 = neuropsychologists.first.id    
neuro2 = neuropsychologists.second.id 
neuro3 = neuropsychologists.third.id

secretaries = Secretary.create([{name:'Nuno Costa', address:'Rua das Fontainhas, Coimbra', telephone:'223421566', mobilephone:'923214007', date_of_birth:'09/12/1960', identification_code:'981324214', active:'true', gender_id: male, clinic_id: clinic1, login_id: login4},
                               {name:'Maria Amaral Antunes', address:'Rua das Flores, Porto', telephone:'223421566', mobilephone:'915226087', date_of_birth:'10/11/1987', identification_code:'981324214', active:'true', gender_id: female, clinic_id: clinic1, login_id: login5}])

secretary1 =   secretaries.first.id       
secretary2 =   secretaries.second.id          
                               
manager = Manager.create([{telephone:'223421566', mobilephone:'923214007', gender_id: male, clinic_id: clinic1, login_id: login6}])

patients = Patient.create([{name:'Rui Pereira',address:'Rua Cabral de Sousa', telephone:'223421566', mobilephone:'923214007', education:'Superior', profession:'Estudante', date_of_birth:'09/12/1960', identification_code:'981324214', active:'true', gender_id: male, clinic_id: clinic1, civil_status_id: st1, handedness_id: h1, login_id: login9}, 
  {name:'Bernardo Portela',address:'Rua Cabral de Sousa', telephone:'223421566', mobilephone:'923214007', education:'Superior', profession:'Estudante', date_of_birth:'09/12/1960', identification_code:'981324214', active:'true', gender_id: male, clinic_id: clinic1, civil_status_id: st1, handedness_id: h1, login_id: login8}])

patient1 = patients.first.id
patient2 = patients.second.id

Login.find(login1).add_role :neuropsychologist
Login.find(login2).add_role :neuropsychologist
Login.find(login3).add_role :neuropsychologist
Login.find(login4).add_role :secretary
Login.find(login5).add_role :secretary
Login.find(login6).add_role :manager
Login.find(login7).add_role :administrator
Login.find(login8).add_role :patient
Login.find(login9).add_role :patient


appointment_types = AppointmentType.create([{name:'Avaliacao'},{name:'Estimulacao'}])
app_type1 = appointment_types.first.id
app_type2 = appointment_types.second.id


appointment_statuses = AppointmentStatus.create([{name:'Marcada'},{name:'Realizada'}])
app_status1 = appointment_statuses.first.id
app_status2 = appointment_statuses.second.id

appointments = Appointment.create([{description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:'15-12-2012 09:00:00',patient_id:patient1,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status2,appointment_type_id:app_type1},
                                  {description:'Sessao que permite ao paciente desenvolver as suas capacidades sonoras',appointment_day:'12-12-2012 10:00:00',patient_id:patient1,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status2,appointment_type_id:app_type1},
                                  {description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:'11-02-2013 10:00:00',patient_id:patient2,secretary_id:secretary2,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
                                  {description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:'15-02-2013 11:00:00',patient_id:patient2,secretary_id:secretary2,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1}])

areas = TestArea.create([{name:'area1'},{name:'area2'}])

testes = EvaluationTest.create([{name:'ftt',description:'descricao teste',test_area_id:areas.first},{name:'tmt',description:'descricao teste',test_area_id:areas.first},{name:'wais',description:'descricao teste',test_area_id:areas.first},{name:'wms',description:'descricao teste',test_area_id:areas.second},{name:'clock',description:'descricao teste',test_area_id:areas.second},])


puts "Success: Data loaded"
