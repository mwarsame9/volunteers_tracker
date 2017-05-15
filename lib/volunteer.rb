class Volunteer

  attr_accessor(:name, :id, :project_id)

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id]
    @project_id = attributes[:project_id]
  end

  define_method(:==) do |another_volunteer|
    self.name == another_volunteer.name
  end


  define_method(:save) do
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{self.name}', 0) RETURNING id;")
    @id = result.first['id'].to_i
  end

  define_singleton_method(:all) do
    volunteers = []
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    returned_volunteers.each() do |volunteer|
      id = volunteer.fetch("id")
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id")
      volunteers.push(Volunteer.new({:id => id, :name => name, :project_id => project_id}))
    end
    volunteers
  end

  define_singleton_method(:find) do |input|
    found_volunteer = nil
    Volunteer.all().each() do |volunteer|
      if volunteer.id().to_i == input
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end

  define_singleton_method(:free) do
    free_volunteers = []
    free_volunteers_db = DB.exec("SELECT * FROM volunteers WHERE project_id = 0;")
    free_volunteers_db.each do |volunteer|
      id = volunteer.fetch("id")
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id")
      free_volunteers.push(Volunteer.new({:id => id, :name => name, :project_id => project_id}))
    end
    free_volunteers
  end

  define_singleton_method(:project) do |input|
    project_volunteers = []
    project_volunteers_db = DB.exec("SELECT * FROM volunteers WHERE project_id = #{input};")
    project_volunteers_db.each do |volunteer|
      id = volunteer.fetch("id")
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i()
      project_volunteers.push(Volunteer.new({:id => id, :name => name, :project_id => project_id}))
    end
    project_volunteers
  end

  define_method(:update_name) do |attributes|
   @name = attributes.fetch(:name)
   DB.exec("UPDATE volunteers SET name = '#{@name}' WHERE id = #{self.id};")
  end

  define_method(:update_project) do |attributes|
   @roject_id = attributes.fetch(:project_id)
   DB.exec("UPDATE volunteers SET project_id = #{@project_id} WHERE id = #{self.id};;")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{self.id};")
  end


end
