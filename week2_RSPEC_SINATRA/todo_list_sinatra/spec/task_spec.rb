require 'rspec'
require_relative '../lib/task.rb'

RSpec.describe "Sinatra TODO list tests" do
  let(:task) { Task.new "Walk the dog" }
  let(:time_format) { "%d-%m-%y %H:%M:%S" }

  describe "Initialize" do
    it "the id's of the Task class by default is unique and auto incremental" do
      expect(task.id).to eq(1)
    end

    it "assigns the specified value of the initialize method to the content attribute" do
      expect(task.content).to eq("Walk the dog")
    end

    it "the default value of the Task class is" do
      expect(task.completed).to be false
    end

    it "the created_at attribute has been assigned now" do
      expect(task.created_at.strftime(time_format)).to eq(Time.now.strftime(time_format))
    end
  end

  describe "#complete?" do
    it "returns, by default, that the task is not finished" do
      expect(task.complete?).to be false
    end
  end

  describe "#complete!" do
    it "completes the task" do
      task.complete!
      expect(task.complete?).to be true
    end
  end

  describe "#make_incomplete!" do
    it "uncompletes the task" do
      task.complete!
      task.make_incomplete!
      expect(task.complete?).to be false
    end
  end

  describe "#update_content!" do
    it "changes the content value of the instance" do
      old_value = task.content
      task.update_content! "Buy some milk"
      expect(task.content).not_to eq(old_value)
    end

    it "checks that the value of the attribute updated_at is Time.now" do
      task.update_content! "Buy some milk"
      expect(task.updated_at.strftime(time_format)).to eq(Time.now.strftime(time_format))
    end
  end
end