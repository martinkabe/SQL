use SampleDB

/*
	Table dbo.users_table_records represents table of users where
	ID columns is foreign key to parrents table.
	Select users where their age is less than age of parrents.
*/

create table dbo.users_table_records
(
	ID int null,
	Name varchar(50) null,
	Street varchar(50) null,
	[user_id] int null,
	Age int
)

insert into dbo.users_table_records values
(NULL, 'Mark Orwell', 'Elm Street 1', 1, 26),
(5, 'Jimmy Hendrics', 'Elm Street 2', 2, 56),
(10, 'Jane Madison', 'Elm Street 3', 3, 21),
(1, 'Eric Clapton', 'Elm Street 4', 4, 33),
(6, 'Vincent Necpal', 'Elm Street 5', 5, 41),
(NULL, 'Jennifer Hunter', 'Elm Street 6', 6, 59),
(NULL, 'Mindy Dirwall', 'Elm Street 7', 7, 23),
(2, 'Matty Ericson', 'Elm Street 8', 8, 27),
(8, 'Petra Cristal', 'Elm Street 9', 9, 35),
(7, 'Antony Queen', 'Elm Street 10', 10, 39)

select * from dbo.users_table_records

select
	*
from dbo.users_table_records u
where u.Age > (
				select uin.Age
				from dbo.users_table_records uin
				where u.ID = uin.user_id
			  )

-- using CTE
;with tin as
(
	select * from dbo.users_table_records
)
select tin.ID, tin.Name, tin.Street, tin.user_id, tin.Age
from tin
inner join dbo.users_table_records tout on tin.ID = tout.user_id
where tin.Age > tout.Age
order by tin.ID

-- using self join
select t.ID, t.Name, t.Street, t.user_id, t.Age
from dbo.users_table_records t
inner join dbo.users_table_records s
on t.ID = s.user_id
where t.Age > s.Age

