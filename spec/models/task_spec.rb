require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:task).save).to be true
  end

  it "is invalid without a title" do
    expect(FactoryBot.build(:task, title: nil).save).to be false
  end

  it "is invalid without details" do
    expect(FactoryBot.build(:task, details: nil).save).to be false
  end

  it "is invalid without an author" do
    expect(FactoryBot.build(:task, author: nil).save).to be false
  end

  it "is invalid without a unique title" do
    FactoryBot.create(:task)
    expect(FactoryBot.build(:task).save).to be false
  end
end
