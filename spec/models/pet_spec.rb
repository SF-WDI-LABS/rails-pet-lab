require 'rails_helper'

RSpec.describe Pet, type: :model do
  subject (:owner) do
    Pet.create({ name: "Fido", breed: "dog"})
  end

  describe Pet do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(255) }

    it { should validate_presence_of(:breed) }
    it { should validate_length_of(:breed).is_at_most(255) }

    # context "when validating an email" do
    #   it "contains an @ symbol" do
    #     owner.email = "asdf"
    #     expect{owner.save!}.to raise_error ActiveRecord::RecordInvalid
    #   end
    # end

    # describe "#normalize_phone_number" do
    #   it "removes a leading 1" do
    #     owner.phone = "12345678901"
    #     owner.normalize_phone_number
    #     expect(owner.phone).to eq("2345678901")
    #   end
    #   it "removes these common characters: (, ), -, ." do
    #     owner.phone = "(749)452.2349, x2-389"
    #     owner.normalize_phone_number
    #     expect(owner.phone).to eq("7494522349 x2389")
    #   end
    # end


  end
end
