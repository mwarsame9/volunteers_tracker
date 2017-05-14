require("spec_helper")

describe(Project) do
  describe(".all") do
    it("starts off with no projects") do
      expect(Project.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      project = Project.new({:id => nil, :name => "Soup Kitchen"})
      expect(project.name()).to(eq("Soup Kitchen"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      project = Project.new({:id => nil, :name => "Soup Kitchen"})
      project.save()
      expect(project.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save projects to the database") do
      project = Project.new({:id => nil, :name => "Soup Kitchen"})
      project.save()
      expect(Project.all()).to(eq([project]))
    end
  end

  describe("#==") do
    it("is the same project if it has the same name") do
      project1 = Project.new({:id => nil, :name => "Soup Kitchen"})
      project2 = Project.new({:id => nil, :name => "Soup Kitchen"})
      expect(project1).to(eq(project2))
    end
  end

  describe(".find") do
    it("returns a project by its ID") do
      test_project = Project.new({:id => nil, :name => "Soup Kitchen"})
      test_project.save
      test_project2 = Project.new({:id => nil, :name => "Childrens Hospital"})
      test_project2.save
      expect(Project.find(test_project2.id())).to(eq(test_project2))
    end
  end

  describe("#volunteers") do
    it("returns an array of volunteers for that project") do
      test_project = Project.new({:id => nil, :name => "Soup Kitchen"})
      test_project.save()
      test_volunteer = Volunteer.new({:name => "John Doe", :project_id => test_project.id()})
      test_volunteer.save()
      test_volunteer2 = test_volunteer = Volunteer.new({:name => "Jane Doe", :project_id => test_project.id()})
      test_volunteer2.save()
      expect(test_project.volunteers()).to(eq([test_volunteer, test_volunteer2]))
    end
  end

  describe("#update") do
    it("lets you update projects in the database") do
      project = Project.new({:id => nil, :name => "Soup Kitchen"})
      project.save()
      project.update({:name => "Animal Shelter"})
      expect(project.name()).to(eq("Animal Shelter"))
    end
  end

  describe("#delete") do
    it("lets you delete a project from the database") do
      project = Project.new({:id => nil, :name => "Soup Kitchen"})
      project.save()
      project2 = Project.new({:id => nil, :name => "Animal Shelter"})
      project2.save()
      project.delete()
      expect(Project.all()).to(eq([project2]))
    end
    it("deletes a project's volunteers from the database") do
      project = Project.new({:id => nil, :name => "Soup Kitchen"})
      project.save()
      volunteer = Volunteer.new({:name => "John Doe", :project_id => project.id()})
      project.save()
      volunteer2 = Volunteer.new({:name => "Jane Doe", :project_id => project.id()})
      volunteer2.save()
      project.delete()
      expect(Volunteer.all()).to(eq([]))
    end
  end

end
