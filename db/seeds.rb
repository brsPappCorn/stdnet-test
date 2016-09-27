# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# TODO: Seeds - revise this file once we receive the lists with info to build dropdowns and other elements

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

Language.create([
                    { language_name: 'Español' },
                    { language_name: 'Ingles' },
                    { language_name: 'Frances' },
                    { language_name: 'Italiano' },
                    { language_name: 'Alemán' }
                ])

Tool.create([
                { tool_name: '3ds Max' },
                { tool_name: 'Adobe After Effects' },
                { tool_name: 'Adobe Dreamweaver' },
                { tool_name: 'Adobe Illustrator' },
                { tool_name: 'Adobe InDesign' },
                { tool_name: 'Adobe Photoshop' },
                { tool_name: 'Adobe Premiere Pro' },
                { tool_name: 'Altium' },
                { tool_name: 'ANSYS' },
                { tool_name: 'ArcGIS' },
                { tool_name: 'Arduino' },
                { tool_name: 'Arena' },
                { tool_name: 'Aspen Plus' },
                { tool_name: 'AutoCAD' },
                { tool_name: 'Bizagi BPM' },
                { tool_name: 'Bloomberg' },
                { tool_name: 'ChemDraw' },
                { tool_name: 'CorelDRAW' },
                { tool_name: 'Distribuciones Lynux' },
                { tool_name: 'Eclipse' },
                { tool_name: 'Excel - Macros' },
                { tool_name: 'Excel - Tablas dinámicas' },
                { tool_name: 'Final Cut' },
                { tool_name: 'GAMS' },
                { tool_name: 'Google Forms' },
                { tool_name: 'HELISA' },
                { tool_name: 'HFSS' },
                { tool_name: 'Inventor' },
                { tool_name: 'LaTex' },
                { tool_name: 'Lectra' },
                { tool_name: 'Lego Mindstorm NXT' },
                { tool_name: 'MATLAB' },
                { tool_name: 'Microsoft Access' },
                { tool_name: 'Microsoft Project' },
                { tool_name: 'Microsoft Visio' },
                { tool_name: 'Oracle Crystall Ball' },
                { tool_name: 'Regedit' },
                { tool_name: 'Rhino 3D' },
                { tool_name: 'Richpeace' },
                { tool_name: 'SAP' },
                { tool_name: 'SigmaPlot' },
                { tool_name: 'Siigo' },
                { tool_name: 'SketchUp' },
                { tool_name: 'Solid Edge' },
                { tool_name: 'SOLIDWORKS' },
                { tool_name: 'SPSS' },
                { tool_name: 'STATA' },
                { tool_name: 'Statgraphics' },
                { tool_name: 'Survey Monkey' },
                { tool_name: 'Windows Movie Maker' },
                { tool_name: 'WordPress' }
            ])

# Linked with Company
Sector.create([
                  { sector_name: 'Agropecuario' },
                  { sector_name: 'Alimentos y Bebidas' },
                  { sector_name: 'Artes Graficas' },
                  { sector_name: 'Asociaciones y Cooperativas' },
                  { sector_name: 'Automotriz' },
                  { sector_name: 'Belleza y Estetica' },
                  { sector_name: 'Calzado' },
                  { sector_name: 'Comercio' },
                  { sector_name: 'Construccion' },
                  { sector_name: 'Cultural, Recreacion y Deporte' },
                  { sector_name: 'Editorial' },
                  { sector_name: 'Educacion' },
                  { sector_name: 'Eléctrico' },
                  { sector_name: 'Electronico' },
                  { sector_name: 'Farmaceutico' },
                  { sector_name: 'Financiero' },
                  { sector_name: 'Informatico y Software' },
                  { sector_name: 'Inmobiliario' },
                  { sector_name: 'Medio Ambiente' },
                  { sector_name: 'Metalúrgico' },
                  { sector_name: 'Minero y Petroleo' },
                  { sector_name: 'Muebles y Maderas' },
                  { sector_name: 'Papel y Cartón' },
                  { sector_name: 'Plásticos' },
                  { sector_name: 'Postal' },
                  { sector_name: 'Público' },
                  { sector_name: 'Químico' },
                  { sector_name: 'Salud' },
                  { sector_name: 'Seguridad Social' },
                  { sector_name: 'Servicios' },
                  { sector_name: 'Telecomunicaciones' },
                  { sector_name: 'Textil y Confección' },
                  { sector_name: 'Transportes y Almacenamiento' },
                  { sector_name: 'Turístico' }
              ])


