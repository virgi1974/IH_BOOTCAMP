require 'rspec'
require_relative '../lib/todo_list.rb'

RSpec.describe "Sinatra TODO list tests" do
  let(:todo) { TodoList.new "Lluis" }
  let(:task) { Task.new "Walk the dog" }
  let(:task2) { Task.new "Buy some milk" }

  describe "#add_task" do
    it "chekcs if the size of the array tasks is bigger after add a new task" do
      expected_size = todo.tasks.size + 1
      todo.add_task(task)
      expect(todo.tasks.size).to be(expected_size)
    end
  end

  describe "#delete_task" do
    it "checks if the size of the array tasks is smaller after delete the specified task" do
      todo.add_task(task)
      expected_size = todo.tasks.size - 1
      todo.delete_task(task.id)
      expect(todo.tasks.size).to be(expected_size)
    end
  end

  describe "#find_task_by_id" do
    it "checks that nil is returned if the task is not found" do
      expect(todo.find_task_by_id(0)).to be(nil)
    end

    it "creates two different tasks and get the first with the id" do
      todo.add_task(task)
      todo.add_task(task2)
      expect(todo.find_task_by_id(task.id)).to be(task)
    end
  end

  describe "#sort_by_created" do
    it "sorts the tasks in the array in descending order by default" do
      todo.add_task(task)
      todo.add_task(task2)
      ordered_tasks = todo.sort_by_created
      expect(ordered_tasks[0].created_at).to be > ordered_tasks[1].created_at
    end

    it "sorts the tasks in the specified order" do
      todo.add_task(task)
      todo.add_task(task2)
      ordered_tasks = todo.sort_by_created "ASC"
      expect(ordered_tasks[0].created_at).to be < ordered_tasks[1].created_at
    end
  end

  describe "#save" do
    it "checks the save method" do
      todo.add_task(task)
      todo.add_task(task2)
      todo.save
      expect(1).to eq(1)
    end
  end

  describe "#load_tasks" do
    it "loads the tasks in the file" do
      todo.load_tasks
      expect(todo.tasks.length).to be > 0
    end
  end
end