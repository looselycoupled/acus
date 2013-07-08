require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  test "create an admin user" do
    assert AdminUser.create!({email: "sometest@example.com", password: "Foobar123", password_confirmation: "Foobar123"})
  end
end
