class Project
  attr_accessor(:id, :name)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
  end

  define_singleton_method(:all) do
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      id = project.fetch("id").to_i()
      name = project.fetch("name")
      projects.push(Project.new({:id => id, :name => name}))
    end
    projects
  end

  define_singleton_method(:find) do |id|
    found_project = nil
    Project.all().each() do |project|
      if project.id().==(id)
        found_project = project
      end
    end
    found_project
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO projects (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_project|
    self.name().==(another_project.name()).&(self.id().==(another_project.id()))
  end

  define_method(:volunteers) do |id|
    # found_list
    # returned_tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{id}")
    # tasks = []
    # returned_tasks.each() do |task|
    #   description = task.fetch("description")
    #   list_id = task.fetch("list_id").to_i
    #   tasks.push(Task.new({:description => description, :list_id => list_id}))
    # end
    # tasks
    found_volunteers = []
    Volunteer.all().each() do |volunteer|
      if volunteer.project_id().==(id)
        found_volunteers.push(task)
      end
    end
    found_volunteers
  end


#   define_method(:sort) do
#     tasks = DB.exec("SELECT * FROM tasks ORDER BY due_date;")
#     ordered_tasks = []
#     tasks.each do |task|
#       description = task.fetch("description")
#       list_id = task.fetch("list_id").to_i()
#       due_date = task.fetch("due_date")
#       ordered_tasks.push(Task.new({:description => description, :list_id => list_id, :due_date => due_date}))
#     end
#     ordered_tasks
#   end


end
