# frozen_string_literal: true

require "test_helper"

class TestClassList < Minitest::Test
  describe "#initialize" do
    def self.test_eq(*args)
      expectation = args.pop
      it "(#{args.inspect}) => #{expectation.inspect}" do
        assert_equal(expectation, ClassList.new(args).to_s, args.inspect)
      end
    end

    test_eq("foo bar baz", "foo bar baz")
    test_eq("foo", "bar", "baz", "foo bar baz")
    test_eq(%w[foo bar baz], "foo bar baz")
    test_eq({foo: true, bar: nil, baz: 1}, "foo baz")
    test_eq(-> { "hi" }, "hi")
    test_eq(nil, "")
  end

  describe "#add!" do
    it "adds classes and returns self" do
      one = ClassList.new("foo")
      one.add!("bar", "baz")

      assert_equal %w[foo bar baz], one.to_a
    end
  end

  describe "#add" do
    it "returns new instance with added classes" do
      one = ClassList.new("foo")
      two = one.add("bar", "baz")

      assert_equal %w[foo], one.to_a
      assert_equal %w[foo bar baz], two.to_a
    end
  end

  describe "#delete!" do
    it "deletes classes and returns self" do
      one = ClassList.new("foo bar baz")
      one.delete!("bar", "baz")
      assert_equal %w[foo], one.to_a
    end
  end

  describe "#delete" do
    it "returns new instance with deleted classes" do
      one = ClassList.new("foo bar baz")
      two = one.delete("bar", "baz")

      assert_equal %w[foo bar baz], one.to_a
      assert_equal %w[foo], two.to_a
    end
  end

  describe "shorthand" do
    it "has a shorthand for ClassList.new" do
      assert_instance_of ClassList, CL("foo bar baz")
    end
  end
end
