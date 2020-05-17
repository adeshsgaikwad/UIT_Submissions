require 'rails_helper'

describe Survey do
  it { should have_many(:questions) }
  it { should validate_presence_of :name }
  it("titleizes the name of an survey") do
    survey = Survey.create({name: "giant steps"})
    expect(survey.name()).to(eq("Giant Steps"))
  end
end
