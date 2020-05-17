require 'rails_helper'

describe Question do
  it { should belong_to(:survey) }
  it { should validate_presence_of :text }
end
