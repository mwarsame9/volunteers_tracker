# require('capybara/rspec')
# require('./app')
# Capybara.app = Sinatra::Application
# set(:show_exceptions, false)
#
# describe('adding a new project', {:type => :feature}) do
#   it('allows a user to click a project to see the volunteers and details for it') do
#     visit('/')
#     click_link('Add New Project')
#     fill_in('name', :with =>'Soup Kitchen')
#     click_button('Add Project')
#     expect(page).to have_content('Success!')
#   end
# end
#
# describe('viewing all of the projects', {:type => :feature}) do
#   it('allows an employee to see all of the projects that have been created') do
#     project = Project.new({:id => 10, :name => 'Soup Kitchen'})
#     project.save()
#     visit('/')
#     click_link('View All Projects')
#     expect(page).to have_content(project.name)
#   end
# end
#
# describe('seeing details for a single project', {:type => :feature}) do
#   it('allows an employee to click a project to see the volunteers and details for it') do
#     test_project = Project.new({:id => 12, :name => 'Childrens Hospital'})
#     test_project.save()
#     test_volunteer = Volunteer.new({:name => "John Doe", :project_id => test_project.id()})
#     test_volunteer.save()
#     visit('/projects')
#     click_link(test_project.name())
#     expect(page).to have_content(test_volunteer.name())
#   end
# end
#
# describe('adding volunteers to a project', {:type => :feature}) do
#   it('allows an employee to add a volunteer to a project') do
#     test_project = Project.new({:id => 4, :name => 'Soup Kitchen'})
#     test_project.save()
#     visit("/projects/#{test_project.id()}")
#     fill_in("name", {:with => "John Doe"})
#     click_button("Add volunteer")
#     expect(page).to have_content("Success!")
#   end
# end
