# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#{name:, surname:, nickname:}
users = User.create([{name:"Bruno", surname:"Hashimoto", email:"bhashimoto@poli.ufrj.br", password:"bananatron", password_confirmation:"bananatron"},
                     {name:"Lucas", surname:"Tostes", email:"lucasrmtostes@gmail.com", password:"bananatron", password_confirmation:"bananatron"}])

#{status:}
registrations = Registration.create([{status:1, user_id:1, classroom_id:1}])

#{name:, description:, beginning:, end:}
classrooms = Classroom.create([{name:"Cálculo I", description:"Limites, derivadas e ingegrais", beginning:"2014-01-01", end:"2014-12-31" }])

#{name:, description:, beginning:, end:}
events = Event.create([{name:"Hackpuc", description:"A maior hackathon do Rio de Janeiro", beginning:"2014-11-19 17:00:00", end:"2014-11-21 12:00:00", classroom_id:1}])

#{status:, user_id:, question_id:}
subscriptions = Subscription.create([{status:1, user_id:1, question_id:1}])

#{title:, description:, rank:, status:, topic_id}
questions = Question.create([{title:"Como derivar x^2?", description:"Eu não entendi muito bem, mas como eu faço para derivar x^2 em relação a x?", rank:0, status:1, topic_id:2}])

#{name:, description:}
topics = Topic.create([{title:"Dúvidas gerais", description:"Qualquer tipo de dúvida sobre cálculo 1", classroom_id:1},
                       {title:"Derivadas", description:"Dúvidas relacionadas a derivadas", parent_topic_id:1}])

#{description:, rank:, status:}
answers = Answer.create([{description:"Derivadas de polinômios se desce o expoente multiplicando.", rank:0, status:1, question_id:1}])

#{title:, description:, send_time:}
notifications = Notification.create([{title:"Próxima aula adiada", description:"Estou doente, não vou poder ir", send_time:"2014-01-19 20:20:20", classroom_id:1}])

