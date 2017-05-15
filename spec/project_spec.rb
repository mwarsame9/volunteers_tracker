require("spec_helper")

describe(Project) do
  describe(".all") do
    it("starts off with no projects") do
      expect(Project.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      project = Project.new({:name => "Soup Kitchen"})
      expect(project.name()).to(eq("Soup Kitchen"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      project = Project.new({:name => "Soup Kitchen"})
      project.save()
      expect(project.id).to(eq(project.id))
    end
  end

  describe("#save") do
    it("lets you save projects to the database") do
      project = Project.new({:name => "Soup Kitchen"})
      project.save()
      expect(Project.all()).to(eq([project]))
    end
  end

  describe("#==") do
    it("is the same project if it has the same name") do
      project1 = Project.new({:name => "Soup Kitchen"})
      project2 = Project.new({:name => "Soup Kitchen"})
      expect(project1 == project2).to(eq(true))
    end
  end

  describe(".find") do
    it("returns a project by its ID") do
      test_project = Project.new({:name => "Soup Kitchen"})
      test_project.save
      test_project2 = Project.new({:name => "Childrens Hospital"})
      test_project2.save
      expect(Project.find(test_project2.id())).to(eq(test_project2))
    end
  end


  describe("#update") do
    it("lets you update projects in the database") do
      project = Project.new({:name => "Soup Kitchen"})
      project.save()
      project.update({:name => "Animal Shelter"})
      expect(project.name()).to(eq("Animal Shelter"))
    end
  end

  describe("#delete") do
    it("lets you delete a project from the database") do
      project = Project.new({:name => "Soup Kitchen"})
      project.save()
      project2 = Project.new({:name => "Animal Shelter"})
      project2.save()
      project.delete()
      expect(Project.all()).to(eq([project2]))
    end
  end

end
