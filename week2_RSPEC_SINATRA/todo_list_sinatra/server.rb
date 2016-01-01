require 'pry'
require 'sinatra'
require 'sinatra/reloader'

require_relative('lib/task.rb')
require_relative('lib/todo_list.rb')


todo_list = TodoList.new("Josh")


get "/tasks" do
	todo_list.load_tasks
	@content = todo_list.tasks
	erb(:task_index)
end

get "/new_task" do
	erb(:new_task)
end

post "/create_task" do
	new_content = params[:content]
 	my_new_task = Task.new(new_content)
 	todo_list.add_task(my_new_task)
  	todo_list.save(my_new_task)

 	redirect to("/tasks")
end

get "/complete/:id" do
	todo_list.complete_task(params[:id])
	redirect to("/tasks")
end
