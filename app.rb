require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/project")
require("./lib/volunteer")
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end

post ('/new_project') do
  project_name = params['project_name']
  Project.new({:name => project_name}).save
  @projects = Project.all
  erb(:projects)
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

get('/project_form') do
  erb(:project_form)
end

get('/project/:id') do
  @project = Project.find(params['id'].to_i)
  @project_volunteers = Volunteer.project(@project.id)
  @free_volunteers = Volunteer.free
  erb(:project)
end

patch('/edit_project/:id') do
  @project = Project.find(params['id'].to_i)
  @name = params['edit-name']
  if @name != ""
    DB.exec("UPDATE projects SET name = '#{@name}' WHERE id = #{@project.id};")
    @project.name = @name
  end
  @project_volunteers = Volunteer.project(@project.id)
  @free_volunteers = Volunteer.free
  erb(:project)
end

patch('/add_volunteer_to_project/:id') do
  @project = Project.find(params['id'].to_i)
  @selected_volunteers =  params['add_volunteers']
  if @selected_volunteers != nil
    @selected_volunteers.each do |volunteer|
      DB.exec("UPDATE volunteers SET project_id = #{@project.id} WHERE id = #{volunteer.to_i};")
    end
  end
  @project_volunteers = Volunteer.project(@project.id)
  @free_volunteers = Volunteer.free
  erb(:project)
end

patch('/remove_volunteer_from_project/:id') do
  @project = Project.find(params['id'].to_i)
  @removed_volunteers =  params['remove_volunteers']
  if @removed_volunteers != nil
    @removed_volunteers.each do |volunteer|
      DB.exec("UPDATE volunteers SET project_id = 0 WHERE id = #{volunteer.to_i};")
    end
  end
  @project_volunteers = Volunteer.project(@project.id)
  @free_volunteers = Volunteer.free
  erb(:project)
end

delete('/delete/:id') do
  project = Project.find(params['id'].to_i)
  DB.exec("UPDATE volunteers SET project_id = 0 WHERE project_id = #{project.id};")
  DB.exec("DELETE FROM projects WHERE id = #{project.id};")
  @projects = Project.all
  erb(:projects)
end

get('/volunteers') do
  @volunteers = Volunteer.all
  erb(:volunteers)
end

get('/volunteer_form') do
  erb(:volunteer_form)
end

post('/new_volunteer') do
  volunteer_name = params['volunteer_name']
  Volunteer.new({:name => volunteer_name, :project_id => 0}).save
  @volunteers = Volunteer.all
  erb(:volunteers)
end

get('/volunteer/:id') do
  @volunteer = Volunteer.find(params['id'].to_i)
  @project = Project.find(@volunteer.project_id.to_i)
  erb(:volunteer)
end

patch('/edit_volunteer/:id') do
  @volunteer = Volunteer.find(params['id'].to_i)
  @name = params['edit-name']
  if @name != ""
    DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{@volunteer.id};")
    @volunteer.name = @name
  end
  @project = Project.find(@volunteer.project_id.to_i)
  erb(:volunteer)
end

patch('/remove_project_from_volunteer/:id') do
  DB.exec("UPDATE volunteers SET project_id = 0 WHERE id = #{params['id'].to_i};")
  @volunteer = Volunteer.find(params['id'].to_i)
  erb(:volunteer)
end

delete('/delete_volunteer/:id') do
  volunteer = Volunteer.find(params['id'].to_i)
  DB.exec("DELETE FROM volunteers WHERE id = #{volunteer.id};")
  @volunteers = Volunteer.all
  erb(:volunteers)
end
