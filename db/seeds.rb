# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# TODO: Seeds - revise this file once we receive the lists with info to build dropdowns and other elements

# Linked with Student
University.create([
                      { university_name: 'Universidad de los Andes' },
                      { university_name: 'Pontificia Universidad Javeriana' },
                      { university_name: 'Otra' }
                  ])

Major.create([
                 { major_name: 'Administración' },
                 { major_name: 'Ingeniería de Sistemas' },
                 { major_name: 'Otra' }
             ])

# Linked with User
City.create([
                { city_name: 'Bogota' },
                { city_name: 'Medellin' },
                { city_name: 'Pasto' }
            ])

Country.create([
                   { country_name: 'Alemania' },
                   { country_name: 'Colombia' },
                   { country_name: 'Mexico' },
                   { country_name: 'Noruega' }
               ])

