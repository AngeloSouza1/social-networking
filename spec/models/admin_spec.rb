require 'rails_helper'
require 'spec_helper'

RSpec.describe Admin, type: :model do
  it "1. admin is valid" do
   admin = Admin.new(email: "admin@admin.com", password: "123456")

   expect(admin.email).to eql "admin@admin.com"
   expect(admin).to be_valid
  end

  it "2. admin is NOT valid" do
    admin = Admin.new(email: "admin@admin.com")

    expect(admin).to_not be_valid
  end
end
