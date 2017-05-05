require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/project")
require("./lib/volunteer")
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})

get("/") do
  erb(:index)
end

get("/projects/new") do
  erb(:project_form)
end

post("/projects") do
  name = params.fetch("name")
  project = Project.new({:id => nil, :name => name})
  project.save()
  erb(:project_success)
end

get('/projects') do
  @project = Project.all()
  erb(:projects)
end

get("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project)
end

post("/volunteers") do
  name = params.fetch("name")
  project_id = params.fetch("project_id").to_i()
  @project = Project.find(project_id)
  @volunteer = Volunteer.new({:name => name, :project_id => project_id})
  @volunteer.save()
  erb(:success)
end
