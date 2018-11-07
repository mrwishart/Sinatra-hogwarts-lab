require('sinatra')
require('sinatra/contrib/all') if development?
require('sinatra/reloader') if development?
require_relative('models/student')
require_relative('models/house')
also_reload('models/student')

# index
get '/students' do
  @students = Student.all()
  erb(:index)
end

# new

get '/students/new' do
  erb(:new)
end

# show

get '/students/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end

# create

post '/students' do
  Student.new(params).save
  redirect to 'students'
end

# edit

get '/students/:id/edit' do
  @student = Student.find(params[:id])
  erb(:edit)
end

# update

post '/students/:id' do
  changed_student = Student.new(params)
  changed_student.update()
  redirect to 'students/' + changed_student.id.to_s
end

# destroy
post '/students/:id/delete' do
  @student = Student.find(params['id'])
  @student.delete
  redirect to 'students'
end
