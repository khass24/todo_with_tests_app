require 'rails_helper'

RSpec.describe List, type: :model do
  describe "#complete_all_tasks!" do
    it "should mark all tasks as complete" do
      list = List.create(name: "Shopping")
      Task.create(complete: false, list_id: list.id, name: "Milk")
      Task.create(complete: false, list_id: list.id, name: "Eggs")

      list.complete_all_tasks!

      list.tasks.each do |task|
        expect(task.complete).to eq(true)
      end
    end
  end

  describe '#snooze_all_tasks!' do
    it "should snooze the deadline of all tasks by one hour" do
      list = List.create(name: "Shopping")
      time = Time.now
      time1 = Time.now + 1.hour
      Task.create(deadline: time)
      Task.create(deadline: time1)

      list.snooze_all_tasks!

      list.tasks.each do |task|
        expect(task.deadline).to eq(deadline + 1.hour)
      end
    end
  end

  describe '#total_duration' do
    it "should return the value of the total duration for all tasks" do
      list = List.create(name: "Shopping")
      Task.create(duration: 10, list_id: list.id)
      Task.create(duration: 15, list_id: list.id)
      Task.create(duration: 30, list_id: list.id)

      total = list.total_duration

      expect(total).to eq(55)
    end
  end

  describe '#incomplete_tasks' do
    it "should return a list of all the incomplete tasks from the list" do
      list = List.create(name: "Shopping")
      Task.create(complete: true, list_id: list.id)
      Task.create(complete: false, list_id: list.id)
      Task.create(complete: false, list_id: list.id)
      Task.create(complete: false, list_id: list.id)

      inc = list.incomplete_tasks.count

      expect(inc).to eq(3)
    end
  end

  describe "#favorite_tasks" do
    it "should return a list of all the favorite tasks from the list" do
      list = List.create(name: "Shopping")
      Task.create(favorite: true, list_id: list.id)
      Task.create(favorite: true, list_id: list.id)
      Task.create(favorite: false, list_id: list.id)
      Task.create(favorite: false, list_id: list.id)
      Task.create(favorite: false, list_id: list.id)

      fave = list.favorite_tasks.count

      expect(fave).to eq(2)
    end
  end
end
