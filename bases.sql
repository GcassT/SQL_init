-- Los nombres de los instructores ---
select name
 from instructor;
 
 -- Select sin repetir datos -- 
 select distinct dept_name, name 
 from instructor;
 
 select name, salary as salario, salary/12 as mensua
 from instructor;
 
 -- Select con literal --
 select ID, 'nombre', 1
 from instructor;
 
 
 select *
 from instructor 
 where dept_name = 'Comp. Sci.';
 
 select upper(name), lower(dept_name)
 from INSTRUCTOR;
 
 -- Select que luzca como e inicie por --
 select * 
 from department
 where dept_name like 'Bio%';
 
 -- Select que luzca y finalice con --
  select * 
 from department
 where dept_name like '%y';
 
 -- Select que en cualquier parte cuente con --
  select * 
 from department
 where dept_name like '%Sci%';
 
 -- Select que inicie con y luego tenga x cantidad de caracteres --
 select *
 from student
 where name like "M__";
 
 -- Consulta que retorna informacipon de la tabla ordenada de A-Z mayor a menor --
 select name, dept_name, tot_cred
 from student
 order by name desc; -- asc = ascendente, desc = descendente --
 

 select name, dept_name, tot_cred
 from student
 order by tot_cred desc; 
 
 select name, dept_name, tot_cred
 from student
 order by dept_name asc, name; -- Aquí se ordena primero dept_name y luego con name --
 
 -- Misma función de las consultas anteriores pero se limita la búsqueda a la cantiadad deseada --
 select name, dept_name, tot_cred
 from student
 where tot_cred > 126 and tot_cred < 128
 order by tot_cred desc
 limit 3; 
 
 -- Consultas con rango --
 select name, salary 
 from instructor 
 where salary between 90000  and 100000
 order by salary asc;
 
 -- Consultas con función --
		-- Promedio --
 select avg(salary) as promedio -- avg = promedio --
 from instructor
 where dept_name = "Accounting";
 
 select avg(tot_cred) as promedio 
 from student
 where tot_cred between 10 and 50;
		
        -- Conteo --
 select count(course_id) -- Cuantos elementos hay en la tabla --
 from course;
 
 select count(distinct dept_name), count(course_id)
 from course;
 
 -- Cuantos profesores hay por dept_name --
 select count(id) as conteo, dept_name
 from instructor
 group by dept_name
 order by conteo;
 
 -- Salario máximo y salario mínimo pero no indica quien --
 select max(salary) 
 from instructor;
 
 -- Misma función pero mas específica --
 select name, salary
 from instructor
 order by salary desc
 limit 1;
 
 -- Consulta donde el salario sea estrictamente igual a la clausura where --
 select name, salary
 from instructor
 where salary = (select max(salary) from instructor); -- Subconsulta --
 
 -- Consultas con dos tablas (joins)
 select *
 from instructor as ins, department as dep; #Producto catesiano
	-- Consulta join clasica --
 select name, building
 from instructor as ins, department as dep 
 where ins.dept_name = dep.dept_name #No importa el orden cuando son solo dos tablas
 order by ins.dept_name;
 
    -- Consulta inner join actualmente usada --
 select name, instructor.dept_name
 from instructor inner join department
 on instructor.dept_name = department.dept_name;
 
 
 select instructor.id, course_id
 from teaches inner join instructor
 on teaches.ID = instructor.id;
 
 -- Taller de diseno --
 select count(student.ID), section.year, classroom.room_number
 from student 
 inner join takes on student.ID = takes.ID
 inner join section on section.course_id = takes.course_id
 inner join classroom on section.building = classroom.building
 group by year;
 
 select count(student.ID), dept_name
 from student
 group by dept_name;
 
 select count(advisor.s_ID) as Num_estudiantes, instructor.name 
 from advisor	 
 inner join instructor on advisor.i_ID = instructor.ID
 group by instructor.name
 order by Num_estudiantes asc;