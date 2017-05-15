class Project

  attr_accessor(:name, :id)

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
  end

  define_method(:==) do |another_project|
    self.name == another_project.name
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO projects (name) VALUES ('#{self.name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:all) do
    projects = []
    returned_projects = DB.exec("SELECT * FROM projects;")
    returned_projects.each() do |project|
      id = project.fetch("id")
      name = project.fetch("name")
      projects.push(Project.new({:id => id, :name => name}))
    end
    projects
  end

  define_singleton_method(:find) do |input|
    found_project = nil
    Project.all().each() do |project|
      if project.id().to_i == input
        found_project = project
      end
    end
    found_project
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    DB.exec("UPDATE projects SET name = '#{@name}' WHERE id = #{self.id};")
    end

  define_method(:delete) do
    DB.exec("DELETE FROM projects WHERE id = #{self.id};")
  end

end
