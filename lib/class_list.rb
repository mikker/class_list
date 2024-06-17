# frozen_string_literal: true

require "set"

require_relative "class_list/version"
require_relative "class_list/shorthand" unless ENV["CLASS_LIST_NO_SHORTHAND"]

class ClassList
  include Enumerable

  def initialize(*values)
    @values = Set.new(normalize(values))
  end

  attr_reader :values

  def each(&block)
    values.each(&block)
  end

  def add(*other)
    self.class.new(to_a + other)
  end

  def add!(*other)
    @values.merge(normalize(other))
  end

  def delete!(*other)
    @values.subtract(normalize(other))
  end

  def delete(*other)
    self.class.new(to_a - other)
  end

  def to_s
    @values.join(" ")
  end

  private

  def normalize(arg)
    case arg
    when String
      arg.split(/\s+/)
    when Array
      arg.flat_map(&method(:normalize))
    when Hash
      arg.map { |k, v| normalize(k) if v }.compact
    when Proc
      normalize(arg.call)
    when nil
      ""
    else
      arg.to_s
    end
  end
end
