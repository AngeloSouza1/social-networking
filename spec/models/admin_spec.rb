require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "admin is valid" do
    admin = Admin.new(email: "admin@admin.com", password; "123456")

    expect(admin.email).to eql "admin@admin.com"




  end
end
