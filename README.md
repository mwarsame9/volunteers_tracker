
**Create a projects table**

volunteer_tracker_test=# \d projects
Table "public.projects"
Column |       Type        |                     Modifiers                      
--------+-------------------+----------------------------------------------------
id     | integer           | not null default nextval('lists_id_seq'::regclass)
name   | character varying |

volunteer_tracker_test=# CREATE TABLE projects (id serial PRIMARY KEY, name varchar);


**Create a volunteers table**

volunteer_tracker_test=# \d volunteers
            Table "public.volunteers"
   Column    |       Type        | Modifiers
-------------+-------------------+-----------
 id          | integer           |
 name        | character varying |
 project_id  | integer           |

 volunteer_tracker_test=# CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int);
 
