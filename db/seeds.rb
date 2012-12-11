# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Implemented by Fábio Silva - 06/12/2012
Neuropsychologist.delete_all
Secretary.delete_all
Manager.delete_all
Patient.delete_all
Clinic.delete_all
Administrator.delete_all
Gender.delete_all

Role.delete_all

Login.delete_all
Type.delete_all
Handedness.delete_all
CivilStatus.delete_all


#Civil_Statuses
statuses = CivilStatus.create([{description:'Solteiro'},{description: 'Casado'}, {description: 'Divorciado'}, {description: 'Viuvo'}])

#Handedness
hand = Handedness.create([{description: 'Destro'}, {description: 'Esquerdino'}])

#Types
types = Type.create([{description:'Administrador'}, {description:'Gestor'}, {description:'Secretaria'}, {description:'Neuropsicologo'}, {description:'Paciente'}])
admin = types.first.id
manager = types.second.id
secretary = types.third.id
neuropsychologist = types.fourth.id
patient = types.fifth.id

#Genders
genders = Gender.create([{description:'Feminino'}, {description:'Masculino'}, {description: 'Outro'}])
female = genders.first.id
male = genders.second.id


#Logins
logins = Login.create([{email:'smr@fpce.uc.pt', password:'qwerty', type_id: neuropsychologist},
                      {email:'sus.antunes@ipnp.pt', password:'qwerty', type_id: neuropsychologist},
                      {email:'fabioscsilva@gmail.com', password:'qwerty', type_id: neuropsychologist},
                       {email:'srodrigues14@gmail.com', password:'qwerty', type_id: secretary},
                        {email:'brunomiguelas@gmail.com', password:'qwerty', type_id: secretary},
                        {email:'manager@gmail.com', password:'qwerty', type_id: manager}])
login1 = logins.first.id
login2 = logins.second.id
login3 = logins.third.id
login4 = logins.fourth.id
login5 = logins.fifth.id
login6 = logins.last.id

#Admin
admins = Administrator.create([{name:'Admin1', password:'qwerty', address:'Braga - UMinho', telephone:'222333444', mobilephone:'912333444', email:'fabio@neuropump.com', active:'true'}])
admin = admins.first.id

#Clinics
clinics = Clinic.create([{name:'Instituto de psicologia e neuropsicologia do porto', address:'Porto',fiscal_number:'321456712', email:'geral@ipnp.pt', telephone:'232444111', active:'true', administrator_id: admin}])
clinic1 = clinics.first.id

#Neuropsychologists
neuropsychologists = Neuropsychologist.create([{name:'Mario Rodrigues Simoes', address:'Rua das Fontainhas, Coimbra', telephone:'223421566', mobilephone:'923214007', date_of_birth:'09/12/1960', identification_code:'981324214', active:'true', gender_id: male, clinic_id: clinic1, login_id: login1},
                                               {name:'Susana Amaral Antunes', address:'Rua das Flores, Porto', telephone:'223421566', mobilephone:'915226087', date_of_birth:'10/11/1987', identification_code:'981324214', active:'true', gender_id: female, clinic_id: clinic1, login_id: login2},
                                               {name:'Fabio Samuel Coelho da Silva', address:'Rua Tomas Pimenta, Porto', telephone:'224224252', mobilephone:'913264006', date_of_birth:'04/07/1980', identification_code:'981324214', active:'true', gender_id: male, clinic_id: clinic1, login_id: login3}])


secretaries = Secretary.create([{name:'Nuno Costa', address:'Rua das Fontainhas, Coimbra', telephone:'223421566', mobilephone:'923214007', date_of_birth:'09/12/1960', identification_code:'981324214', active:'true', gender_id: male, clinic_id: clinic1, login_id: login4},
                               {name:'Maria Amaral Antunes', address:'Rua das Flores, Porto', telephone:'223421566', mobilephone:'915226087', date_of_birth:'10/11/1987', identification_code:'981324214', active:'true', gender_id: female, clinic_id: clinic1, login_id: login5}])
                               
manager = Manager.create([{telephone:'223421566', mobilephone:'923214007', gender_id: male, clinic_id: clinic1, login_id: login6}])

Login.find(login6).add_role :manager
Login.find(login1).add_role :neuropsychologist
Login.find(login2).add_role :neuropsychologist
Login.find(login3).add_role :neuropsychologist
Login.find(login4).add_role :secretary
Login.find(login5).add_role :secretary


puts "Success: Data loaded"