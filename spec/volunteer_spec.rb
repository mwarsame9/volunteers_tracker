require("spec_helper")

describe(Volunteer) do
  describe('#==') do
    it("is the same volunteer if they have the same name") do
      volunteer1 = Volunteer.new({:name => "John Doe", :project_id => 1})
      volunteer2 = Volunteer.new({:name => "John Doe", :project_id => 1})
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Volunteer.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("adds a volunteer to the array of saved volunteers") do
      test_volunteer = Volunteer.new({:name => "John Doe", :project_id => 1})
      test_volunteer.save()
      expect(Volunteer.all()).to(eq([test_volunteer]))
    end
  end

  describe('#name') do
    it("lets you see the name of a volunteer") do
      test_volunteer = Volunteer.new({:name => "John Doe", :project_id => 1})
      expect(test_volunteer.name()).to(eq("John Doe"))
    end
  end

  describe("#project_id") do
    it("lets you see the project ID of a volunteer") do
      test_volunteer = Volunteer.new({:name => "John Doe", :project_id => 1})
      expect(test_volunteer.project_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same volunteer if they have the same name") do
      volunteer1 = Volunteer.new({:name => "John Doe", :project_id => 1})
      volunteer2 = Volunteer.new({:name => "John Doe", :project_id => 1})
      expect(volunteer1).to(eq(volunteer2))
    end
  end

end
