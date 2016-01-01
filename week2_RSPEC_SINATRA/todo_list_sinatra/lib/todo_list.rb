require 'pry'

module ManageData
  def initialize
    @file_url = './public/data.txt'
  end
def save(task)

      IO.write(@file_url,task.id, File.size(@file_url), mode: "a")
      IO.write(@file_url," ", File.size(@file_url), mode: "a")

      IO.write(@file_url,task.content, File.size(@file_url), mode: "a")
      IO.write(@file_url," ", File.size(@file_url), mode: "a")

      IO.write(@file_url,task.created_at, File.size(@file_url), mode: "a")
      IO.write(@file_url," ", File.size(@file_url), mode: "a")

      IO.write(@file_url,task.updated_at, File.size(@file_url), mode: "a")
      IO.write(@file_url," ", File.size(@file_url), mode: "a")

      IO.write(@file_url,task.completed, File.size(@file_url), mode: "a")
      IO.write(@file_url,"\n", File.size(@file_url), mode: "a")

  end

  def load_tasks
    @tasks = []
    content_file = IO.read('./public/data.txt')
    
      tasks_file  = content_file.split("\n")
     
      tasks_file.each do |array|
        array_splitted = array.split(" ")
        temp = Task.new("")
          temp.id = array_splitted[0]
          temp.content = array_splitted[1]
          temp.created_at = array_splitted[2] + array_splitted[3]
          temp.completed = array_splitted[4]
        @tasks << temp
      end
  end  

end

class TodoList
  attr_reader :tasks, :user, :tasks_from_file
  include ManageData

  def initialize user_name
    @tasks_from_file = []
    @tasks = []
    @user = user_name
    @file_url = './public/data.txt'
    @max_id = 0
  end

  
# ------------- array filled from saved file

  def find_id task_id
    @tasks.each do |task|
      if task.id.to_i > @max_id
      binding.pry
        @max_id = task.id.to_i
      end
    end

    if task_id >= @max_id
      update = false
    else
      update = true
    end
    update
  end

# -------------
  def complete_task task_id
    @tasks.each do |task|
      if task.id == task_id.to_s
        task.completed = "true"
        save(task)
      end
    end

  end

  def add_task task
    if find_id(task.id) == false
      @tasks << task
    else
      task.update_id(@max_id + 1)
      @tasks << task
    end
  end

  def delete_task task_id
    @tasks.delete_if { |task| task.id == task_id }
  end

  def find_task_by_id task_id
    @task = @tasks.find { |task| task.id == task_id }
  end

  def sort_by_created order_by = "DESC"
    if(order_by == "DESC")
      @tasks.sort do | task1, task2 |
        task2.created_at <=> task1.created_at
      end
    elsif(order_by == "ASC")
      @tasks.sort do | task1, task2 |
        task1.created_at <=> task2.created_at
      end
    end
  end

  
end