require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  @user = User.new(
    name: "Aaron",
    email:      "tester@example.com",
    password:   "dottle-nouveau-pavilion-tights-furze",
  )


  it "is valid with a name, email, and password" do
     user = User.new(
       name: "Aaron",
       email:      "tester@example.com",
       password:   "dottle-nouveau-pavilion-tights-furze",
     )
     expect(user).to be_valid
   end


  it "name should be present" do
    user = User.new(
      name: "",
      email:      "tester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
    expect(user).not_to be_valid
  end

  it "email should be present" do
    user = User.new(
      name: "hogehoge",
      email:      "",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
    expect(user).not_to be_valid
  end

  it "name should not be too long" do
  user = User.new(
    name: "a" * 51,
    email:      "tester@example.com",
    password:   "dottle-nouveau-pavilion-tights-furze",
  )
  expect(user).not_to be_valid
  end

  it "email should not be too long" do
    user = User.new(
     name:  "Tester",
     email:      "a" * 244 + "@example.com",
     password:   "dottle-nouveau-pavilion-tights-furze",
   )
  expect(user).not_to be_valid
  end

  it "email validation should accept valid addresses" do
    user = User.new(
      name: "hogehoge",
      email:      "",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to be_valid, "#{valid_address.inspect} should be valid"
    end
  end

  it "email validation should reject invalid addresses" do
    user = User.new(
      name: "hogehoge",
      email:      "",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).not_to be_valid, "#{invalid_address.inspect} should be invalid"
    end
  end

  it "email addresses should be saved as lower-case" do
    user = User.new(
      name: "hogehoge",
      email:      "",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
  mixed_case_email = "Foo@ExAMPle.CoM"
  user.email = mixed_case_email
  user.save
  expect(mixed_case_email.downcase).to eq user.reload.email
  end
  it "is invalid with a duplicate email address" do
    User.create(
      name:  "George",
      email:      "tester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
    user = User.new(
     name:  "Tester",
     email:      "tester@example.com",
     password:   "dottle-nouveau-pavilion-tights-furze",
   )
   user.valid?
   expect(user.errors[:email]).to include("has already been taken")
  end

  it "password should be present (nonblank)" do
    user = User.new(
      name: "Aaron",
      email:      "tester@example.com",
      password:   "",
    )
  user.password = user.password_confirmation = " " * 6
  expect(user).not_to be_valid
  end

  it "password should have a minimum length" do
    user = User.new(
      name: "Aaron",
      email:      "tester@example.com",
      password:   "",
    )
  user.password = user.password_confirmation = "a" * 5
  expect(user).not_to be_valid
  end
end
