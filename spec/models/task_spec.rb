require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "#toggle_complete!" do
    it "should swap false to true and vice versa for complete" do
      task = Task.create(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it "should swap true to false and vice versa for complete" do
      task = Task.create(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end

  describe "#toggle_favorite!" do
    it "should swap true to false and vice versa for favorite" do
      task = Task.create(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end

    it "should swap false to true and vice versa for favorite" do
      task = Task.create(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end

  describe "#overdue?" do
    it "should show if the deadline has passed" do
      task = Task.create(deadline: Time.now + 30.minutes)
      task.overdue?
      expect(task.overdue?).to eq(false)
    end
  end

  describe "#increment_priority!" do
    it "should increase the priority by 1" do
      task = Task.create(priority: 1)
      task.increment_priority!
      expect(task.priority).to eq(2)
    end
  end

  describe "#decrement_priority!" do
    it "should decrease the priority by 1" do
      task = Task.create(priority: 2)
      task.decrement_priority!
      expect(task.priority).to eq(1)
    end
  end

  # describe "#snooze_hour!" do
  #   it "should increase the deadline by 1 hour" do
  #     task = Task.create(deadline: 1.hour.from_now)
  #     task.snooze_hour!
  #     expect(task.deadline).to eq(2.hours.from_now)
  #   end
  # end
end