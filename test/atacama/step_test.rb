# frozen_string_literal: true

require 'test_helper'
require 'atacama/step'

class StepReturningOptionFake < Atacama::Step
  def call
    Option(foo: 'bar')
  end
end

class StepReturningReturnFake < Atacama::Step
  def call
    Return(true)
  end
end

describe Atacama::Step do
  it 'can return a Option value object' do
    result = StepReturningOptionFake.call
    assert_instance_of Atacama::Values::Option, result
    assert_equal({ foo: 'bar' }, result.value)
  end

  it 'can return a Return value object' do
    result = StepReturningReturnFake.call
    assert_instance_of Atacama::Values::Return, result
    assert_equal(true, result.value)
  end
end