require_relative '../test_helper'

class TaskManagerTest < Minitest::Test

  def setup
    TaskManager.create({ :title       => "title one",
                         :description => "description one"})
    TaskManager.create({ :title       => "title two",
                         :description => "description two"})
  end

  def test_it_creates_a_task
    task = TaskManager.find(1)

    assert_equal "title one", task.title
    assert_equal "description one", task.description
    assert_equal 1, task.id
  end

  def test_all_returns_every_task
    assert_equal 2, TaskManager.all.size
  end

  def test_find_returns_task_for_specific_id
    assert_equal "title two", TaskManager.find(2).title
  end

  def test_update_changes_task_attributes
    new_title = "new title"
    new_description = "new description"

    TaskManager.update(1, {
                          title: new_title,
                          description: new_description,
                          id: 1
                        })

    assert_equal new_title, TaskManager.find(1).title
    assert_equal new_description, TaskManager.find(1).description
  end

  def test_delete_removes_task_for_specific_id
    TaskManager.delete(2)

    assert_equal 1, TaskManager.all.size
    assert_equal false, TaskManager.find(2)
  end

  def test_delete_all_removes_every_task
    TaskManager.delete_all

    assert_equal 0, TaskManager.all.size
  end

end
