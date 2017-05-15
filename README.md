 # Volunteers Tracker

 #### Week three ruby individual project, building an application that tracks projects and the volunteers working on them 05/5/17

 #### By Mohamed Warsame

 ## Description

 The application allows employees to track projects and the volunteers working on them. Each volunteer will belong to only one project (one project, many volunteers). Employees will be able to view, add, update and delete projects, view, add, update and delete volunteers.

 ## Setup/Installation Requirements
 *In terminal run*
 * postgres
 * psql
 * CREATE DATABASE volunteer_tracker;

 **SQL**
 *Create a projects table*

 volunteer_tracker_test=# \d projects
 Table "public.projects"
 Column |       Type        |                     Modifiers                      
 --------+-------------------+----------------------------------------------------
 id     | integer           | not null default nextval('lists_id_seq'::regclass)
 name   | character varying |

 volunteer_tracker_test=# CREATE TABLE projects (id serial PRIMARY KEY, name varchar);


 *Create a volunteers table*

 volunteer_tracker_test=# \d volunteers
             Table "public.volunteers"
    Column    |       Type        | Modifiers
 -------------+-------------------+-----------
  id          | integer           |
  name        | character varying |
  project_id  | integer           |

  volunteer_tracker_test=# CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int);

 ## Known Bugs

 Sinatra

 ## Support and contact details

 Please feel free to contact me at my github profile (mwarsame9) directly.

 ## Technologies Used

 * Ruby
 * Sinatra
 * SQL
 * Capybara
 * HTML
 * Bootstrap


 ### License

 MIT

 Copyright (c) 2017 **Mohamed Warsame**
