require("spec_helper")

describe(Volunteer) do
  describe('#==') do
    it("is the same volunteer if they have the same name") do
      volunteer1 = Volunteer.new({:name => "John Doe"})
      volunteer2 = Volunteer.new({:name => "John Doe"})
      expect(volunteer1 == volunteer2).to(eq(true))
    end
  end

  describe(".all") do
    it("is empty at first") do
      volunteer1 = Volunteer.new({:name => "John Doe"})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => "Jane Doe"})
      volunteer2.save
      expect(Volunteer.all()).to(eq(volunteer1, volunteer2))
    end
  end

  describe('#save') do
    it("adds a volunteer to the array of saved volunteers") do
      test_volunteer = Volunteer.new({:name => "John Doe")
      test_volunteer.save()
      expect(Volunteer.all()).to(eq([test_volunteer]))
    end
  end

  describe('#name') do
    it("lets you see the name of a volunteer") do
      test_volunteer = Volunteer.new({:name => "John Doe"})
      expect(test_volunteer.name()).to(eq("John Doe"))
    end
  end

  describe("#id") do
    it("will return the name of the volunteer") do
      volunteer1 = Volunteer.new({:name => "John Doe", :id => 1})
      expect(volunteer1.id).to(eq(1))
    end
  end

  describe("#project_id") do
    it("lets you see the project ID of a volunteer") do
      test_volunteer = Volunteer.new({:name => "John Doe", :id => 1, :project_id => 1})
      expect(test_volunteer.project_id()).to(eq(1))
    end
  end

  describe(".find") do
    it("lets you find  a volunteer by id") do
      volunteer1 = Volunteer.new({:name => "John Doe"})
      volunteer2 = Volunteer.new({:name => "Jane Doe"})
      volunteer1.save
      volunteer2.save
      expect(Volunteer.find(volunteer1.id)).to(eq(volunteer1))
    end
  end

  describe("#update_name") do
    it("lets you edit the name of the volunteer") do
      volunteer1 = Volunteer.new({:name => "John Doe"})
      volunteer1.save
      volunteer1.update_name({:name => "Jane Doe"})
      expect(volunteer1.name).to(eq("Jane Doe"))
    end
  end

  describe("#delete") do
    it("lets you delete a volunteer") do
      volunteer1 = Volunteer.new({:name => "John Doe"})
      volunteer1.save
      volunteer1.delete
      expect(Volunteer.all).to(eq([]))
    end
  end

  describe(".free") do
    it("lets you see all volunteers without a project") do
      volunteer1 = Volunteer.new({:name => "John Doe"})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => "Jane Doe"})
      volunteer2.save
      expect(Volunteer.available).to(eq([volunteer1, volunteer2]))
    end
  end

  describe(".project") do
    it("lets you see all volunteers for a project") do
      volunteer1 = Volunteer.new({:name => "John Doe"})
      volunteer1.save
      volunteer2 = Volunteer.new({:name => "Jane Doe"})
      volunteer2.save
      expect(Volunteer.project(1)).to(eq([]))
    end
  end

end
