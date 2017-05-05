require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/project")
require("./lib/volunteer")
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})

get("/") do
  @project = Project.all()
  erb(:index)
end

post("/projects") do
  name = params.fetch("name")
  project = Project.new({:id => nil, :name => name})
  project.save()
  @project = Project.all()
  erb(:index)
end

get("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project)
end

post("/volunteers") do
  name = params.fetch("name")
  project_id = params.fetch("project_id").to_i()
  volunteer = Volunteer.new({:name => name, :project_id => project_id})
  volunteer.save()
  @project = Project.find(project_id)
  erb(:project)
end

get("/projects/:id/edit") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project_edit)
end

get("/projects/:id/edit") do
  @project = Project.find(params.fetch("id").to_i())
  erb(:project_edit)
end

patch("/projects/:id") do
  name = params.fetch("name")
  @project = Project.find(params.fetch("id").to_i())
  @project.update({:name => name})
  erb(:project)
end

delete("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i())
  @project.delete()
  @projects = Project.all()
  erb(:index)
end
