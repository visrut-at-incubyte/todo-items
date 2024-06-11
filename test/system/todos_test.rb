require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit todos_url

    assert_selector "h1", text: "Todo List" # Updated to match the actual text
  end

  test "creating a Todo increases the count" do
    visit todos_url
    initial_count = all('.todo-item').count # Assuming each todo has a class 'todo-item'

    click_on "Create Todo" # Adjust if the button has a different label

    fill_in "Description", with: "My new todo"
    click_on "Create Todo" # Adjust if the button has a different label

    assert_selector('.todo-item', count: initial_count + 1)
  end

  test "destroying a Todo reduces the count" do
    visit todos_url
    initial_count = all('.todo-item').count # Assuming each todo has a class 'todo-item'

    within first('.todo-item') do
      click_on "Delete", match: :first
    end

    assert_selector('.todo-item', count: initial_count - 1)
  end
end
