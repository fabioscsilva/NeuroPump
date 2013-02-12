# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Implemented by Fábio Silva - 06/12/2012
PackagesClinic.delete_all
Package.delete_all
Payment.delete_all
WmsResult.delete_all
WaisResult.delete_all
FttResult.delete_all
ClockResult.delete_all
TmtResult.delete_all
AppointmentPlan.delete_all
EvaluationTest.delete_all
TestArea.delete_all
EvaluationTest.delete_all
Appointment.delete_all
AppointmentStatus.delete_all
AppointmentType.delete_all
Neuropsychologist.delete_all
Secretary.delete_all
Manager.delete_all
ClinicalHistory.delete_all
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
st2 = statuses.second.id
st3 = statuses.third.id
st4 = statuses.fourth.id

#Handedness
hand = Handedness.create([{description: 'Destro'}, {description: 'Esquerdino'}])
h1 = hand.first.id
h2 = hand.second.id

#Genders
genders = Gender.create([{description:'Feminino'}, {description:'Masculino'}, {description: 'Outro'}])
female = genders.first.id
male = genders.second.id

#Packages
packages = Package.create([{n_exercises:'20',n_evaluations: '10', n_appointments: '10', price: '89.90', name: 'Standard'},
                          {n_exercises:'100',n_evaluations: '30', n_appointments: '20', price: '249.90', name: 'Premium'},
                          {n_exercises:'-1',n_evaluations: '-1', n_appointments: '-1', price: '749.90', name: 'Professional'}])


#Logins
logins = Login.create([{email:'smr@fpce.uc.pt', password:'qwerty'},
                      {email:'sus.antunes@ipnp.pt', password:'qwerty'},
                      {email:'dPereira@gmail.com', password:'qwerty'},
                       {email:'mAmaral@gmail.com', password:'qwerty'},
                        {email:'brunomiguelas@gmail.pt', password:'qwerty'},
                        {email:'manager@cnaj.com', password:'qwerty'},
                        {email:'admin@neuropump.com', password:'qwerty'},
                        {email:'MariaAntunes@gmail.com', password:'qwerty'},
                        {email:'ruipereir@gmail.com', password:'qwerty'},
                        {email:'fabioSil@fpce.uc.pt', password:'qwerty'},
                        {email:'gabiCou@ipnp.pt', password:'qwerty'},
                        {email:'BrSantos@gmail.pt', password:'qwerty'},
                        {email:'PRodrigues@gmail.pt', password:'qwerty'},
                        {email:'AnaP@fpce.uc.pt', password:'qwerty'},
                        {email:'AVincente@ipnp.pt', password:'qwerty'},
                        {email:'TSalgueiro@gmail.pt', password:'qwerty'},
                        {email:'manager1@fpce.uc.pt', password:'qwerty'},
                        {email:'manager2@fpce.uc.pt', password:'qwerty'},
                        {email:'manager3@fpce.uc.pt', password:'qwerty'},
                        {email:'ruiRodri@fpce.uc.pt', password:'qwerty'},
                        {email:'HeldCond@fpce.uc.pt', password:'qwerty'},
                        {email:'JoseRodrig@fpce.uc.pt', password:'qwerty'},
                        {email:'AnaSoa@fpce.uc.pt', password:'qwerty'},
                        {email:'IoSal@fpce.uc.pt', password:'qwerty'},
                        {email:'SaraM@fpce.uc.pt', password:'qwerty'},
                        {email:'DeTe@fpce.uc.pt', password:'qwerty'},
                        {email:'MarciaSan@fpce.uc.pt', password:'qwerty'},
                        {email:'LiliSilva@fpce.uc.pt', password:'qwerty'},
                        {email:'RuiPires@fpce.uc.pt', password:'qwerty'},
                        {email:'DiogoCosta@fpce.uc.pt', password:'qwerty'},
                        {email:'MarcoFerreira@fpce.uc.pt', password:'qwerty'}])
login1 = logins.first.id
login2 = logins.second.id
login3 = logins.third.id
login4 = logins.fourth.id
login5 = logins.fifth.id
login6 = logins[5].id
login7 = logins[6].id
login8 = logins[7].id
login9 = logins[8].id
login10 = logins[9].id
login11 = logins[10].id
login12 = logins[11].id
login13 = logins[12].id
login14 = logins[13].id
login15 = logins[14].id
login16 = logins[15].id
login17 = logins[16].id
login18 = logins[17].id
login19 = logins[18].id
login20 = logins[19].id
login21 = logins[20].id
login22 = logins[21].id
login23 = logins[22].id
login24 = logins[23].id
login25 = logins[24].id
login26 = logins[25].id
login27 = logins[26].id
login28 = logins[27].id
login29 = logins[28].id
login30 = logins[29].id
login31 = logins[30].id


#Admin
admins = Administrator.create([{name:'Nuno Filipe Ribeiro Costa', login_id: login7, address:'Rua dos Bragas n 145 Braga', telephone:'221544896', mobilephone:'915584568'}])
admin = admins.first.id

#Clinics
clinics = Clinic.create([{name:'Clinica de Neuropsicologia Dr. Alvin Jones', address:'Avenida da Boavista n245 - Porto',fiscal_number:'321456712', email:'geral@cnaj.pt', telephone:'232444111', administrator_id: admin},
                         {name:'Instituto de Psicologia e neuropsicologia do Porto', address:'Rua Joao Moura n 647 - Coimbra',fiscal_number:'865423598', email:'info@anitataub.pt', telephone:'236541489', administrator_id: admin},
                          {name:'NeuroPsicoCentro', address:'Rua Coronel Linhares n 943 - Lisboa',fiscal_number:'875412547', email:'contacto@neuropsicocentro.pt', telephone:'215688954', administrator_id: admin},
                           {name:'Casa de Saude de Almada', address:'Quinta Igreja n 3 - Almada',fiscal_number:'548632159', email:'info@cscarnaxide.pt', telephone:'214785632', administrator_id: admin}])
clinic1 = clinics.first.id  
clinic2 = clinics.second.id
clinic3 = clinics.third.id
clinic4 = clinics.fourth.id

#PackageClinics
PackagesClinic.create([
                      {package_id: packages.third.id, appointment_token: packages.third.n_appointments, start_date: '23/01/2013', week: '1', clinic_id: clinic1},
                      {package_id: packages.second.id, appointment_token: packages.second.n_appointments, start_date: '09/01/2013', week: '1', clinic_id: clinic2},
                      {package_id: packages.first.id, appointment_token: packages.first.n_appointments, start_date: '01/01/2013', week: '1', clinic_id: clinic3},
                      {package_id: packages.first.id, appointment_token: packages.first.n_appointments, start_date: '14/01/2013', week: '1', clinic_id: clinic4}
                    ])




#Neuropsychologists
neuropsychologists = Neuropsychologist.create([{name:'Mario Rodrigues Simoes', address:'Rua das Fontainhas, Coimbra', telephone:'223421566', mobilephone:'923214007', date_of_birth:'09/12/1960', identification_code:'981324214', gender_id: male, clinic_id: clinic1, login_id: login1},
                                               {name:'Susana Amaral Antunes', address:'Rua das Flores, Porto', telephone:'223421566', mobilephone:'915226087', date_of_birth:'10/11/1987', identification_code:'456845213', gender_id: female, clinic_id: clinic1, login_id: login2},
                                               {name:'Daniel de Matos Pereira', address:'Rua Dr Joaquim Pedrosa, Lisboa', telephone:'214578963', mobilephone:'965114785', date_of_birth:'15/10/1986', identification_code:'125487539', gender_id: male, clinic_id: clinic1, login_id: login3},
                                               {name:'Paulo Sousa Matos', address:'Rua Tomas Pimenta, Porto', telephone:'224224252', mobilephone:'913264006', date_of_birth:'04/07/1980', identification_code:'548756951', gender_id: male, clinic_id: clinic2, login_id: login10},
                                               {name:'Gabriela Sousa Coutinho', address:'Rua Marques de Sao Vincente n23, Faro', telephone:'289654478', mobilephone:'936523325', date_of_birth:'22/01/1975', identification_code:'258149632', gender_id: female, clinic_id: clinic2, login_id: login11},
                                               {name:'Bruno Miguel Sousa Santos', address:'Avenida da republica n 12, Gaia', telephone:'221544568', mobilephone:'9145898745', date_of_birth:'03/12/1979', identification_code:'986951475', gender_id: male, clinic_id: clinic3, login_id: login12},
                                               {name:'Paulo Sousa Rodrigues', address:'Rua da constituicao n54, Braga', telephone:'235412369', mobilephone:'965412357', date_of_birth:'25/09/1972', identification_code:'859654178', gender_id: male, clinic_id: clinic4, login_id: login13}])

neuro1 = neuropsychologists.first.id    
neuro2 = neuropsychologists.second.id
neuro3 = neuropsychologists.third.id
neuro4 = neuropsychologists.fourth.id
neuro5 = neuropsychologists.fifth.id
neuro6 = neuropsychologists[5].id
neuro7 = neuropsychologists[6].id



# ------------- SECRETARIAS
secretaries = Secretary.create([{name:'Marco Freitas Amaral', address:'Rua dos Sousas n234 - Coimbra', telephone:'245895684', mobilephone:'964256984', date_of_birth:'09/11/1978', identification_code:'985685654', gender_id: male, clinic_id: clinic1, login_id: login4},
                                {name:'Ana Sofia Rebelo Pinto', address:'Rua Alvaro Cabral n23 - Lisboa', telephone:'214589569', mobilephone:'936547141', date_of_birth:'23/05/1986', identification_code:'745845123', gender_id: female, clinic_id: clinic1, login_id: login14},
                                {name:'Ana Maria Vincente', address:'Praceta Pinto Rebelo n12 - Valongo', telephone:'223547852', mobilephone:'912585695', date_of_birth:'11/01/1960', identification_code:'856547845', gender_id: female, clinic_id: clinic2, login_id: login15},
                                {name:'Tania Sousa Salgueiro', address:'Rua dos Reis n345 - Vila Real', telephone:'269547841', mobilephone:'963656325', date_of_birth:'05/04/1988', identification_code:'854754125', gender_id: female, clinic_id: clinic3, login_id: login16},
                                {name:'Maria Amaral Antunes', address:'Avenida dos tempos n675 - Braganca', telephone:'289563214', mobilephone:'968745489', date_of_birth:'10/10/1979', identification_code:'875412541', gender_id: female, clinic_id: clinic4, login_id: login5}])

secretary1 =   secretaries.first.id       
secretary2 =   secretaries.second.id   
secretary3 =   secretaries.third.id   
secretary4 =   secretaries.fourth.id   
secretary5 =   secretaries.fifth.id          
                      
                      

                    
# ------------ GESTORES DE CLINICAS                               
manager = Manager.create([{telephone:'223421566', mobilephone:'923214007', gender_id: male, clinic_id: clinic1, login_id: login6},
                          {telephone:'215478563', mobilephone:'963656956', gender_id: male, clinic_id: clinic2, login_id: login17},
                          {telephone:'235698565', mobilephone:'968457412', gender_id: male, clinic_id: clinic3, login_id: login18},
                          {telephone:'223654741', mobilephone:'912541212', gender_id: female, clinic_id: clinic4, login_id: login19}])


# ---------- PACIENTES
patients = Patient.create([{name:'Rui Santos Rodrigues',address:'Rua Cabral de Sousa n123 - Braga', telephone:'235145696', mobilephone:'963574521', education:'4 classe', profession:'Pintor', date_of_birth:'12/12/1983', identification_code:'985654741', gender_id: male, clinic_id: clinic1, civil_status_id: st1, handedness_id: h1, login_id: login20}, 
                          {name:'Helder Costa Conduto',address:'Rua dos Caminhos n12 - Gaia', telephone:'223545695', mobilephone:'912545896', education:'Superior', profession:'Desempregado', date_of_birth:'05/07/1978', identification_code:'985658452', gender_id: male, clinic_id: clinic1, civil_status_id: st2, handedness_id: h1, login_id: login21}, 
                          {name:'Jose Fernando Rodrigues',address:'Rua dos passarinhos - Porto', telephone:'223565985', mobilephone:'936584512', education:'Superior', profession:'Estudante', date_of_birth:'09/01/1989', identification_code:'854752258', gender_id: male, clinic_id: clinic1, civil_status_id: st1, handedness_id: h2, login_id: login22}, 
                          {name:'Ana Sousa Soares',address:'Rua das pombas n45 - Amarante', telephone:'223541541', mobilephone:'963512458', education:'--', profession:'Camionista', date_of_birth:'05/12/1984', identification_code:'785458854', gender_id: female, clinic_id: clinic1, civil_status_id: st3, handedness_id: h1, login_id: login23}, 
                          {name:'Iolanda Salgueiro',address:'Rua Senhor dos Aflitos - Coimbra', telephone:'265895685', mobilephone:'912547845', education:'5  ano', profession:'Vendedor', date_of_birth:'15/04/1983', identification_code:'986521336', gender_id: female, clinic_id: clinic1, civil_status_id: st2, handedness_id: h2, login_id: login24}, 
                          {name:'Sara Sousa Maia',address:'Rua Estado da India n24 - Lisboa', telephone:'215455696', mobilephone:'936584512', education:'6 ano', profession:'Desempregado', date_of_birth:'19/07/1984', identification_code:'854751254', gender_id: female, clinic_id: clinic1, civil_status_id: st2, handedness_id: h2, login_id: login25}, 
                          {name:'Debora Teixeira',address:'Travessa Costa Couto - Lisboa', telephone:'215458745', mobilephone:'965895123', education:'Superior', profession:'Vendedor', date_of_birth:'29/09/1985', identification_code:'854751254', gender_id: female, clinic_id: clinic2, civil_status_id: st1, handedness_id: h1, login_id: login26}, 
                          {name:'Marcia Santos',address:'Rua feira Nova n45 - Braga', telephone:'236598741', mobilephone:'923214007', education:'--', profession:'Feirante', date_of_birth:'30/12/1985', identification_code:'652352632', gender_id: female, clinic_id: clinic2, civil_status_id: st4, handedness_id: h1, login_id: login27}, 
                          {name:'Liliana Silva',address:'Praceta Loureiro - Castelo Branco', telephone:'256956985', mobilephone:'912547535', education:'4 classe', profession:'Mecanico', date_of_birth:'21/01/1976', identification_code:'741254125', gender_id: female, clinic_id: clinic2, civil_status_id: st2, handedness_id: h2, login_id: login28}, 
                          {name:'Rui Pires',address:'Rua das Alminhas n56 - Barcelos', telephone:'235414785', mobilephone:'936235748', education:'6 ano', profession:'Professor', date_of_birth:'09/02/1977', identification_code:'754125124', gender_id: male, clinic_id: clinic2, civil_status_id: st1, handedness_id: h1, login_id: login29}, 
                          {name:'Diogo Nuno Costa',address:'Avenida dos Santosn67 - Braga', telephone:'236951563', mobilephone:'965845784', education:'12 ano', profession:'Empregado', date_of_birth:'02/06/1978', identification_code:'875412415', gender_id: male, clinic_id: clinic3, civil_status_id: st2, handedness_id: h1, login_id: login30}, 
                          {name:'Marco Ferreira',address:'Rua Pinheiro n45 - Braga', telephone:'231475362', mobilephone:'923569512', education:'10 ano', profession:'Secretario', date_of_birth:'22/03/1978', identification_code:'758451254', gender_id: male, clinic_id: clinic3, civil_status_id: st2, handedness_id: h1, login_id: login31}, 
                          {name:'Pedro Sousa Pinto',address:'Rua 25 de Abril n78 - Lisboa', telephone:'215485357', mobilephone:'912352256', education:'4 classe', profession:'Desempregado', date_of_birth:'03/03/1979', identification_code:'874512541', gender_id: male, clinic_id: clinic4, civil_status_id: st1, handedness_id: h1, login_id: login9}, 
                           {name:'Maria Sousa Antunes',address:'Rua Aldeia Nova n67 - Tavira', telephone:'289654157', mobilephone:'963695412', education:'12', profession:'Estudante', date_of_birth:'23/06/1980', identification_code:'124153628', gender_id: male, clinic_id: clinic4, civil_status_id: st3, handedness_id: h2, login_id: login8}])

patient1 = patients.first.id
patient2 = patients.second.id
patient3 = patients.third.id
patient4 = patients.fourth.id
patient5 = patients.fifth.id
patient6 = patients[5].id
patient7 = patients[6].id
patient8 = patients[7].id
patient9 = patients[8].id
patient10 = patients[9].id
patient11 = patients[10].id
patient12 = patients[11].id
patient13 = patients[12].id
patient14 = patients[13].id

# ------------------ ATRIBUICAO DE ROLES
Login.find(login1).add_role :neuropsychologist
Login.find(login2).add_role :neuropsychologist
Login.find(login3).add_role :neuropsychologist
Login.find(login10).add_role :neuropsychologist
Login.find(login11).add_role :neuropsychologist
Login.find(login12).add_role :neuropsychologist
Login.find(login13).add_role :neuropsychologist
Login.find(login4).add_role :secretary
Login.find(login5).add_role :secretary
Login.find(login14).add_role :secretary
Login.find(login15).add_role :secretary
Login.find(login16).add_role :secretary
Login.find(login6).add_role :manager
Login.find(login17).add_role :manager
Login.find(login18).add_role :manager
Login.find(login19).add_role :manager
Login.find(login7).add_role :administrator
Login.find(login8).add_role :patient
Login.find(login9).add_role :patient
Login.find(login20).add_role :patient
Login.find(login21).add_role :patient
Login.find(login22).add_role :patient
Login.find(login23).add_role :patient
Login.find(login24).add_role :patient
Login.find(login25).add_role :patient
Login.find(login26).add_role :patient
Login.find(login27).add_role :patient
Login.find(login28).add_role :patient
Login.find(login29).add_role :patient
Login.find(login30).add_role :patient
Login.find(login31).add_role :patient



appointment_types = AppointmentType.create([{name:'Avaliacao'},{name:'Estimulacao'}])
app_type1 = appointment_types.first.id
app_type2 = appointment_types.second.id


appointment_statuses = AppointmentStatus.create([{name:'Marcada'},{name:'Realizada'},{name:'Em Avaliacao'}])
app_status1 = appointment_statuses.first.id
app_status2 = appointment_statuses.second.id

appointments = Appointment.create([{description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:' '+(Date.today - 1.day).strftime("%d-%m-%Y")  +' 09:00:00',patient_id:patient1,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver a sua capacidade de atencao',appointment_day:' '+(Date.today - 1.day).strftime("%d-%m-%Y")  +' 14:00:00',patient_id:patient1,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:' '+(Date.today - 2.day).strftime("%d-%m-%Y")  +' 15:00:00',patient_id:patient2,secretary_id:secretary2,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades cognitivas visuo-espaciais e de construcao.',appointment_day:' '+(Date.today).strftime("%d-%m-%Y")  +' 10:30:00',patient_id:patient1,secretary_id:secretary2,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver a sua capacidade de atencao',appointment_day:' '+(Date.today + 1.day).strftime("%d-%m-%Y")  +' 11:00:00',patient_id:patient2,secretary_id:secretary2,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:' '+(Date.today + 1.day).strftime("%d-%m-%Y")  +' 12:00:00',patient_id:patient3,secretary_id:secretary2,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type2},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades de atencao',appointment_day:' '+(Date.today + 2.day).strftime("%d-%m-%Y")  +' 09:30:00',patient_id:patient3,secretary_id:secretary2,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades motoras',appointment_day:' '+(Date.today - 15.day).strftime("%d-%m-%Y")  +' 10:00:00',patient_id:patient1,secretary_id:secretary1,neuropsychologist_id:neuro1,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades motoras',appointment_day:' '+(Date.today - 9.day).strftime("%d-%m-%Y")  +' 12:00:00',patient_id:patient1,secretary_id:secretary1,neuropsychologist_id:neuro1,appointment_status_id:app_status1,appointment_type_id:app_type2},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:' '+(Date.today - 8.day).strftime("%d-%m-%Y")  +' 09:30:00',patient_id:patient1,secretary_id:secretary1,neuropsychologist_id:neuro1,appointment_status_id:app_status1,appointment_type_id:app_type2},
{description:'Sessao que permite ao paciente desenvolver a sua capacidade de atencao',appointment_day:' '+(Date.today - 1.day).strftime("%d-%m-%Y")  +' 15:30:00',patient_id:patient1,secretary_id:secretary1,neuropsychologist_id:neuro1,appointment_status_id:app_status1,appointment_type_id:app_type1},     
{description:'Sessao que permite ao paciente desenvolver a sua capacidade de flexibilidade mental',appointment_day:' '+(Date.today + 1.day).strftime("%d-%m-%Y")  +' 16:00:00',patient_id:patient1,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades de velocidade de processamento',appointment_day:' '+(Date.today + 5.day).strftime("%d-%m-%Y")  +' 12:00:00',patient_id:patient1,secretary_id:secretary1,neuropsychologist_id:neuro1,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidade de memoria de trabalho',appointment_day:' '+(Date.today + 10.day).strftime("%d-%m-%Y")  +' 09:00:00',patient_id:patient1,secretary_id:secretary1,neuropsychologist_id:neuro1,appointment_status_id:app_status1,appointment_type_id:app_type2},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades cognitivas visuo-espaciais e de construcao.',appointment_day:' '+(Date.today + 11.day).strftime("%d-%m-%Y")  +' 11:00:00',patient_id:patient1,secretary_id:secretary1,neuropsychologist_id:neuro1,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades de atencao',appointment_day:' '+(Date.today + 12.day).strftime("%d-%m-%Y")  +' 11:00:00',patient_id:patient1,secretary_id:secretary1,neuropsychologist_id:neuro1,appointment_status_id:app_status1,appointment_type_id:app_type2},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:' '+(Date.today - 15.day).strftime("%d-%m-%Y")  +' 10:30:00',patient_id:patient2,secretary_id:secretary1,neuropsychologist_id:neuro2,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades cognitivas visuo-espaciais e de construcao.',appointment_day:' '+(Date.today - 13.day).strftime("%d-%m-%Y")  +' 10:00:00',patient_id:patient2,secretary_id:secretary2,neuropsychologist_id:neuro2,appointment_status_id:app_status1,appointment_type_id:app_type2},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:' '+(Date.today - 9.day).strftime("%d-%m-%Y")  +' 11:30:00',patient_id:patient2,secretary_id:secretary3,neuropsychologist_id:neuro2,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades motoras',appointment_day:' '+(Date.today - 5.day).strftime("%d-%m-%Y")  +' 10:00:00',patient_id:patient2,secretary_id:secretary2,neuropsychologist_id:neuro2,appointment_status_id:app_status1,appointment_type_id:app_type2},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades cognitivas visuo-espaciais e de construcao.',appointment_day:' '+(Date.today - 1.day).strftime("%d-%m-%Y")  +' 09:00:00',patient_id:patient2,secretary_id:secretary1,neuropsychologist_id:neuro2,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver a capacidade de flexibilidade mental',appointment_day:' '+(Date.today + 1.day).strftime("%d-%m-%Y")  +' 09:30:00',patient_id:patient2,secretary_id:secretary3,neuropsychologist_id:neuro2,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:' '+(Date.today + 5.day).strftime("%d-%m-%Y")  +' 11:30:00',patient_id:patient2,secretary_id:secretary1,neuropsychologist_id:neuro2,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver a sua capacidade de flexibilidade mental',appointment_day:' '+(Date.today - 2.day - 1.month ).strftime("%d-%m-%Y")  +' 11:30:00',patient_id:patient3,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades motoras',appointment_day:' '+(Date.today - 5.day).strftime("%d-%m-%Y")  +' 11:30:00',patient_id:patient3,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades de atencao',appointment_day:' '+(Date.today + 1.day + 1.week).strftime("%d-%m-%Y")  +' 11:30:00',patient_id:patient3,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:' '+(Date.today + 5.day + 2.week).strftime("%d-%m-%Y")  +' 11:30:00',patient_id:patient3,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type2},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades motoras',appointment_day:' '+(Date.today + 0.day + 2.week).strftime("%d-%m-%Y")  +' 11:30:00',patient_id:patient3,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver a sua capacidade de flexibilidade mental',appointment_day:' '+(Date.today + 1.month).strftime("%d-%m-%Y")  +' 11:30:00',patient_id:patient3,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver a sua capacidade de atencao',appointment_day:' '+(Date.today + 3.month).strftime("%d-%m-%Y")  +' 11:30:00',patient_id:patient5,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:' '+(Date.today + 1.day + 2.month).strftime("%d-%m-%Y")  +' 09:00:00',patient_id:patient5,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type2},
{description:'Sessao que permite ao paciente desenvolver a sua capacidade de flexibilidade mental',appointment_day:' '+(Date.today + 3.month).strftime("%d-%m-%Y")  +' 09:30:00',patient_id:patient5,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades cognitivas visuo-espaciais e de construcao.',appointment_day:' '+(Date.today + 3.month).strftime("%d-%m-%Y")  +' 17:30:00',patient_id:patient5,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver a sua capacidade de atencao',appointment_day:' '+(Date.today + 4.month).strftime("%d-%m-%Y")  +' 16:30:00',patient_id:patient4,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type2},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades de atencao',appointment_day:' '+(Date.today + 5.month).strftime("%d-%m-%Y")  +' 14:30:00',patient_id:patient4,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades motoras',appointment_day:' '+(Date.today + 3.month).strftime("%d-%m-%Y")  +' 15:00:00',patient_id:patient5,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type2},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:' '+(Date.today + 2.month).strftime("%d-%m-%Y")  +' 15:30:00',patient_id:patient4,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type2},
{description:'Sessao que permite ao paciente desenvolver a sua capacidade de atencao',appointment_day:' '+(Date.today + 3.month).strftime("%d-%m-%Y")  +' 11:30:00',patient_id:patient3,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:' '+(Date.today + 2.month).strftime("%d-%m-%Y")  +' 10:00:00',patient_id:patient2,secretary_id:secretary1,neuropsychologist_id:neuro3,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades cognitivas visuo-espaciais e de construcao.',appointment_day:' '+(Date.today - 1.day).strftime("%d-%m-%Y")  +' 10:00:00',patient_id:patient7,secretary_id:secretary3,neuropsychologist_id:neuro4,appointment_status_id:app_status1,appointment_type_id:app_type1},    # clinica 2
{description:'Sessao que permite ao paciente desenvolver as suas capacidades motoras',appointment_day:' '+(Date.today).strftime("%d-%m-%Y")  +' 17:00:00',patient_id:patient7,secretary_id:secretary3,neuropsychologist_id:neuro4,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades de atencao',appointment_day:' '+(Date.today + 1.day).strftime("%d-%m-%Y")  +' 09:00:00',patient_id:patient7,secretary_id:secretary3,neuropsychologist_id:neuro4,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades motoras',appointment_day:' '+(Date.today - 1.day).strftime("%d-%m-%Y")  +' 10:00:00',patient_id:patient11,secretary_id:secretary4,neuropsychologist_id:neuro6,appointment_status_id:app_status1,appointment_type_id:app_type1},     # clinica 3
{description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:' '+(Date.today).strftime("%d-%m-%Y")  +' 14:00:00',patient_id:patient11,secretary_id:secretary4,neuropsychologist_id:neuro6,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver a sua capacidade de atencao',appointment_day:' '+(Date.today + 1.day).strftime("%d-%m-%Y")  +' 11:00:00',patient_id:patient11,secretary_id:secretary4,neuropsychologist_id:neuro6,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver as suas capacidades visuais',appointment_day:' '+(Date.today - 1.day).strftime("%d-%m-%Y")  +' 10:00:00',patient_id:patient13,secretary_id:secretary5,neuropsychologist_id:neuro7,appointment_status_id:app_status1,appointment_type_id:app_type1},     #clinica 4
{description:'Sessao que permite ao paciente desenvolver a sua capacidade de flexibilidade mental',appointment_day:' '+(Date.today).strftime("%d-%m-%Y")  +' 14:30:00',patient_id:patient13,secretary_id:secretary5,neuropsychologist_id:neuro7,appointment_status_id:app_status1,appointment_type_id:app_type1},
{description:'Sessao que permite ao paciente desenvolver a sua capacidade de atencao',appointment_day:' '+(Date.today + 1.day).strftime("%d-%m-%Y")  +' 11:00:00',patient_id:patient13,secretary_id:secretary5,neuropsychologist_id:neuro7,appointment_status_id:app_status1,appointment_type_id:app_type1}])


appointment = appointments.second.id
appointment2 = appointments.fourth.id

areas = TestArea.create([{name:'area1'},{name:'area2'}])

testes = EvaluationTest.create([{name:'ftt',description:'Intuito de medir a velocididade motora',test_area_id: areas.first.id},
  {name:'tmt',description:'Intuito de medir a atencao, a fexibilidade mental, a procura visual e a funcao motora',test_area_id: areas.first.id},
  {name:'wais',description:'Permite medir a velocidade de processamento',test_area_id:areas.first.id},
  {name:'wms',description:'Intuito de avaliar a memoria de trabalho do paciente',test_area_id:areas.second.id},
  {name:'clock',description:'Permite avaliar as capacidades cognitivas visuo-espaciais e de construcao.',test_area_id:areas.second.id},])
test1 = testes.first.id
test2 = testes.second.id
test3 = testes.third.id
test4 = testes.fourth.id
test5 = testes.fifth.id

#atient1,secretary_id:secretary1,neuropsychologist_id:neuro3 app 2
#criar plano
planos = AppointmentPlan.create([{appointment_id: appointment, evaluation_test_id: test1},
                                {appointment_id:  appointment, evaluation_test_id: test2},
                                {appointment_id:  appointment, evaluation_test_id: test3},
                                {appointment_id:  appointment, evaluation_test_id: test4},
                                {appointment_id:  appointment, evaluation_test_id: test5},
                                {appointment_id:  appointment2, evaluation_test_id: test3},    # segunda avaliação que permite comparar os resultados com a primeira
                                {appointment_id:  appointment2, evaluation_test_id: test4},
                                {appointment_id:  appointment2, evaluation_test_id: test1},
                                {appointment_id:  appointment2, evaluation_test_id: test2},
                                {appointment_id:  appointment2, evaluation_test_id: test5}])
                                
#resultado dos planos da primeira avaliação
#ftt
FttResult.create([{test_phase: 1 ,first: 20 , second:21,third:22,fourth:19,fifth:20,sixth:24,seventh:23,eighth:16,ninth:18,tenth:23,observations:'Realizou o teste com a mao dominante com grande sucesso',appointment_plan_id:planos.first.id},
                  {test_phase: 2 ,first: 22 , second:20,third:24,fourth:20,fifth:20,sixth:24,seventh:23,eighth:19,ninth:19,tenth:23,observations:'Embora este teste tenha sido realizado com a mao nao dominante esta obteve melhores resultados',appointment_plan_id:planos.first.id}])
#tmt
TmtResult.create([{phase:1,time:'00:02:40',observations:'Teste realizado com sucesso',appointment_plan_id: planos.second.id},
                  {phase:2,time:'00:03:00',observations:'trails B realizado com mais dificuldade',appointment_plan_id: planos.second.id}])
#wais
WaisResult.create([{phase:1,spent_time:'00:01:40',correct_items:12,wrong_items:10,observations:'Teste realizado com sucesso',appointment_plan_id: planos.third.id},
            {phase:2,spent_time:'00:02:00',correct_items:12,wrong_items:10,observations:'Teste realizado com sucesso',appointment_plan_id: planos.third.id}])
#wms
WmsResult.create([{phase:1,correct_items:11,wrong_items:10,observations:'Teste realizado com sucesso',appointment_plan_id: planos.fourth.id},
            {phase:2,correct_items:9,wrong_items:12,observations:'Teste realizado com sucesso',appointment_plan_id: planos.fourth.id}])
#clock
ClockResult.create([{screen_result:1,number_seq_result:2,pointers_loc_result:2,observations:'Teste realizado com sucesso',appointment_plan_id: planos.fifth.id}])

#falta clinical history

puts "Data Load Succeded"