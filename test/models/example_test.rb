require 'test_helper'

class ExampleTest < ActiveSupport::TestCase
  # ActiveRecord thinks it's nested/joined tables
  test "query with hash structure" do
    numbers = { list: [1,2,3] }
    e = Example.create(numbers: numbers)
    a = Example.where(numbers: numbers).first
    assert_equal e, a, "didn't find Example"
  end

  # ActiveRecord double-escapes the string, so it does not match
  test "query with JSON string" do
    numbers = { list: [1,2,3] }
    e = Example.create(numbers: numbers)
    a = Example.where(numbers: numbers.to_json).first
    assert_equal e, a, "didn't find Example"
  end

  test "query with array" do
    numbers = [1,2,3]
    e = Example.create(numbers: numbers)
    a = Example.where(numbers: numbers).first
    assert_equal e, a, "didn't find Example"
  end

  #  this workaround works!
  test "query with SQL placeholder" do
    numbers = { list: [1,2,3] }
    e = Example.create(numbers: numbers)
    a = Example.where("numbers = ?", numbers.to_json).first
    assert_equal e, a, "didn't find Example"
  end
end
