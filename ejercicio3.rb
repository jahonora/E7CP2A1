require 'colorize'
#Adding initial data to the hash

$students = [
	{
		name: "Ignacio",
		age: 	"18",
		district: "Macul",
		gender: "Masculino",
	},
	{
		name: "Juan Pablo",
		age: 	"20",
		district: "San Joaquin",
		gender: "Masculino",
	},
	{
		name: "Francisca",
		age: 	"25",
		district: "Providencia",
		gender: "Femenino",
	},
	{
		name: "Antonio",
		age: 	"28",
		district: "Las Condes",
		gender: "Masculino",
	},
	{
		name: "Pedro",
		age: 	"20",
		district: "Ñuñoa",
		gender: "Masculino",
	},
	{
		name: "Maria",
		age: 	"24",
		district: "Macul",
		gender: "Femenino",
	},
	{
		name: "Josefina",
		age: 	"21",
		district: "Recoleta",
		gender: "Femenino",		
	},
	{
		name: "Mario",
		age: 	"23",
		district: "Providencia",
		gender: "Masculino",	
	},
	{
		name: "Marcelo",
		age: 	"19",
		district: "Ñuñoa",
		gender: "Masculino",	
	},
	{
		name: "Andres",
		age: 	"22",
		district: "Providencia",
		gender: "Masculino",	
	},
	{
		name: "Felipe",
		age: 	"23",
		district: "San Joaquin",
		gender: "Masculino",		
	}
]
#Definamos el Menu
menu = "Entrando al Menu principal, por favor elija una opción:
		1. Ingresar nuevo Alumno
		2. Editar un Alumno
		3. Eliminar un Alumno
		4. Mostrar la cantidad de Alumnos
		5. Mostrar las comunas de los Alumnos
		6. Mostrar Alumnos que están entre los 20 y 25 años
		7. Mostrar la suma de las edades de todos los Alumnos
		8. Mostrar el promedio de las edades de los Alumnos
		9. Mostrar el listado de Alumnos según su genero
		10. Salir
		"

#Generamos los metodos
def add_student(name = nil, age = nil, district = nil, gender = nil)
	if name.nil? || age.nil? || district.nil? || gender.nil?
		puts "Los datos ingresados no son validos, hay valores nulos que son necesarios".red
	else
		if find_student(name)
			puts "El alumno ya existe, no se puede agregar".red
		else
			$students << {
						name: name.to_s, 
						age: age.to_s,
						district: district.to_s,
						gender: gender.to_s,
					}
			puts "Alumno agregado con éxito".green
		end
		
	end
end
def find_student(name = nil)
	index = nil
	if name.nil? 
		puts "Es necesario el nombre para poder realizar la búsqueda".red
	else
		$students.each_with_index{|e, i| index = i if e[:name].downcase == name.downcase}
	end
	index
end
def edit_student(name = nil, age = nil, district = nil, gender = nil)
	if name.nil?
		puts "Es necesario el nombre para poder realizar la búsqueda".red
	else
		index = find_student(name)
		if index
			$students[index][:age] = age.to_s if age
			$students[index][:district] = district.to_s if district
			$students[index][:gender] = gender.to_s if gender
			puts "El alumno fue editado con exito".green
		else
			puts "El alumno no existe, por favor intente con un nombre de alumno que si exista".red
		end
	end
end
def delete_student(name = nil)
	if name.nil?
		puts "Es necesario el nombre para poder realizar la búsqueda".red
	else
		index = find_student(name)
		if index
			$students.delete_at(index)
			puts "El alumno fue eliminado con exito".green
		else
			puts "El alumno no existe, por favor intente con un nombre de alumno que si exista".red
		end
	end
end
def how_many_students?
	$students.count
end
def show_students(age_min = 0, age_max = 200)
	students = []
	$students.each do |e|
		students << e if (e[:age].to_i >= age_min && e[:age].to_i <= age_max)
	end
	students
end
def show_districts
	districts = []
	$students.each do |e|
		new_district = true
		districts.each { |i|
			new_district = false if i.downcase == e[:district].downcase
		}
		districts << e[:district] if new_district 
	end
	districts
end

def sum_students_ages
	sum = 0
	$students.each do |e|
		sum += e[:age].to_i
	end
	sum
end

def average_students_ages
	sum_students_ages/$students.count
end

def students_by_gender
	$students.group_by{|e| e[:gender]}
end

def nice_printing(a)
	text = ""
	a.each_with_index do |e, index|
		text += "#{index+1}. "
		text += "Nombre: #{e[:name]}; "
		text += "Edad: #{e[:age]}; "
		text += "Comuna: #{e[:district]}; "
		text += "Genero: #{e[:gender]}; \n"
	end
	text
end
#Comenzamos a generar los ciclos
puts "**************************************************".yellow
puts "Bienvenido al administrador de Alumnos".yellow

option = 0


while option != 10
	puts "BASE DE DATOS ACTUAL:".blue
	puts "#{nice_printing($students)}".blue
	puts "#{menu}".yellow
	print "Por favor ingrese una opción: ".yellow
	option = gets.chomp.to_i
	case option
	when 1
		puts "Por favor ingrese los datos del Alumno a AGREGAR en el siguiente formato: nombre,edad,comuna,genero".yellow
		input = gets.chomp.split(",")
		add_student(input[0],input[1],input[2],input[3])
	when 2
		puts "Por favor ingrese los datos del Alumno a EDITAR en el siguiente formato: nombre,edad,comuna,genero".yellow
		input = gets.chomp.split(",")
		edit_student(input[0],input[1],input[2],input[3])
	when 3
		puts "Por favor ingrese el nombre del Alumno a ELIMINAR".yellow
		input = gets.chomp
		delete_student(input)
	when 4
		puts "La cantidad de Alumnos que hay en la base de datos es: #{$students.count}".green
	when 5
		puts "Mostrando las comunas de los Alumnos ingresados".green
		puts "#{show_districts}".green
	when 6
		puts "Mostrando Alumnos entre las edades de 20 y 25 años".green
		puts "#{nice_printing(show_students(20,25))}".green
	when 7
		puts "Mostrando la suma de las edades de todos los Alumnos: #{sum_students_ages}".green
	when 8
		puts "Mostrando el promedio de edades de todos los Alumnos: #{average_students_ages}".green
	when 9
		puts "Mostrando los Alumnos agrupados según su genero: ".green
		puts "Masculino"
		puts "#{nice_printing(students_by_gender["Masculino"])}".green
		puts "Femenino"
		puts "#{nice_printing(students_by_gender["Femenino"])}".green
	end
end





