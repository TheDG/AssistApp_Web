# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

aux = Teacher.create(name: 'Pedro',
                     last_name: 'Cortes',
                     email: 'Email@uc.cl',
                     rut: '943671137-2',
                     password: 'topsecret',
                     password_confirmation: 'topsecret')

aux2 = Teacher.create(name: 'Diego',
                      last_name: 'Sinay',
                      email: 'dsinay@uc.cl',
                      rut: '123123-2',
                      admin: true,
                      password: '123123',
                      password_confirmation: '123123')

course1 = Course.create(teacher_id: aux.id,
                        subject: 'Math',
                        grade: '8',
                        level: 'b')

students = []

nombres = %w[juan pedro diego jose josefina raul gabriel maria juan sofia]

ruts = ['23556256-3', '23347118-1', '23765349-8', '23257839-8',
        '23226899-2', '23468343-3', '23764165-6', '23158042-6', '23942584-7', '23984934-3']

0.upto(4) do |i|
  stuaux = Student.create(name: nombres[i], rut: ruts[i])
  course1.students << stuaux
  course1.save
  students << stuaux
end

course2 = Course.create(teacher_id: aux2.id,
                        subject: 'English',
                        grade: '12',
                        level: 'HL2')

5.upto(9) do |i|
  stuaux = Student.create(name: nombres[i], rut: ruts[i])
  course2.students << stuaux
  course2.save
  students << stuaux
end

1.upto(10) do |i|
  0.upto(4) do |j|
    Assistance.create(date: DateTime.new(2017, 5, i, 10, 0, 0),
                      attend: [true, true, true, false].sample,
                      student_id: students[j].id,
                      course_id: course1.id)
  end
end

1.upto(10) do |i|
  5.upto(9) do |j|
    Assistance.create(date: DateTime.new(2017, 5, i, 10, 0, 0),
                      attend: [true, true, true, false].sample,
                      student_id: students[j].id,
                      course_id: course2.id)
  end
end
