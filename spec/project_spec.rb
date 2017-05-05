require("spec_helper")

describe("Project") do
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

end
