require 'spec_helper'

require_relative '../lib/prompter.rb'

describe 'Prompter' do
  before :each do
    @test_prompter = Prompter.new
  end

  it 'should introduce itself to the user' do
    pending('message to user')
    fail
  end

  it 'should save user choice as json' do
    pending('fill it with some json then save it')
    @test_prompter.save_as_json
    fail
  end
end
