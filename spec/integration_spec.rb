require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new project', {:type => :feature}) do
  it('allows a user to add a project') do
    visit('/')
    click_link('Add a Project')
    fill_in('project_name', :with =>'Project 1')
    click_button('Submit')
    expect(page).to have_content('Project 1')
  end
end

describe('viewing all of the projects', {:type => :feature}) do
  it('allows a user to see all of the projects that have been created') do
    Project.new({:name => 'Project 1'}).save()
    visit('/')
    click_link('View All Projects')
    expect(page).to have_content('Project 1')
  end
end

describe("editing a project", {:type => :feature}) do
  it('allows a user to edit a project') do
    project1 = Project.new({:name => 'Project 1'})
    project1.save
    visit("/project/#{project1.id}")
    fill_in('edit-name', :with => 'Project 2')
    click_button('Submit')
    expect(page).to have_content('Project 2')
  end
end

describe('adding a new volunteer', {:type => :feature}) do
  it('allows a user to add a volunteer') do
    visit('/')
    click_link('Add a Volunteer')
    fill_in('volunteer_name', :with =>'Volunteer 1')
    click_button('Submit')
    expect(page).to have_content('Volunteer 1')
  end
end

describe('viewing all of the volunteers', {:type => :feature}) do
  it('allows a user to see all of the volunteers that have been created') do
    Volunteer.new({:name => 'Volunteer 1'}).save()
    visit('/')
    click_link('View All Volunteers')
    expect(page).to have_content('Volunteer 1')
  end
end

describe("editing a volunteer", {:type => :feature}) do
  it('allows a user to edit a volunteer') do
    volunteer1 = Volunteer.new({:name => 'Volunteer 1'})
    volunteer1.save
    visit("/volunteer/#{volunteer1.id}")
    fill_in('edit-name', :with => 'Volunteer 2')
    click_button('Submit')
    expect(page).to have_content('Volunteer 2')
  end
end
