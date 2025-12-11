require "../spec_helper"

# About Enums
#
# Enums define a set of named constants with underlying integer values.
# They're great for representing fixed sets of options.
# Crystal enums are type-safe and can have methods.

enum Color
  Red
  Green
  Blue
end

enum HttpStatus
  Ok         = 200
  Created    = 201
  BadRequest = 400
  NotFound   = 404
  ServerError = 500
end

enum Permission
  Read    = 1
  Write   = 2
  Execute = 4
end

@[Flags]
enum FilePermissions
  Read
  Write
  Execute
end

enum Day
  Sunday
  Monday
  Tuesday
  Wednesday
  Thursday
  Friday
  Saturday

  def weekend?
    self == Sunday || self == Saturday
  end

  def weekday?
    !weekend?
  end
end

describe "About Enums" do
  it "knows enums define named constants" do
    color = Color::Red
    color.should eq(__)
  end

  it "knows enums have underlying integer values" do
    Color::Red.value.should eq(__)
    Color::Green.value.should eq(__)
    Color::Blue.value.should eq(__)
  end

  it "knows enums can have custom values" do
    HttpStatus::Ok.value.should eq(__)
    HttpStatus::NotFound.value.should eq(__)
  end

  it "knows enums can be compared" do
    (Color::Red == Color::Red).should eq(__)
    (Color::Red == Color::Blue).should eq(__)
  end

  it "knows enums convert to string" do
    Color::Red.to_s.should eq(__)
    HttpStatus::NotFound.to_s.should eq(__)
  end

  it "knows enums can be parsed from string" do
    Color.parse("Red").should eq(__)
    Color.parse("green").should eq(__)  # Case insensitive
  end

  it "knows enums can be created from values" do
    Color.from_value(0).should eq(__)
    HttpStatus.from_value(404).should eq(__)
  end

  it "knows about all enum values" do
    Color.values.size.should eq(__)
    Color.values.first.should eq(__)
  end

  it "knows enums can have methods" do
    Day::Saturday.weekend?.should eq(__)
    Day::Monday.weekend?.should eq(__)
    Day::Wednesday.weekday?.should eq(__)
  end

  it "knows flags enums support bitwise operations" do
    perms = FilePermissions::Read | FilePermissions::Write
    perms.read?.should eq(__)
    perms.write?.should eq(__)
    perms.execute?.should eq(__)
  end

  it "knows flags enums have power-of-two values" do
    FilePermissions::Read.value.should eq(__)
    FilePermissions::Write.value.should eq(__)
    FilePermissions::Execute.value.should eq(__)
  end

  it "knows enums work in case statements" do
    def describe_color(c : Color) : String
      case c
      when Color::Red   then "stop"
      when Color::Green then "go"
      when Color::Blue  then "water"
      else "unknown"
      end
    end

    describe_color(Color::Red).should eq(__)
    describe_color(Color::Green).should eq(__)
  end

  it "knows enums can be iterated" do
    names = [] of String
    Color.each { |c| names << c.to_s }
    names.should eq(__)
  end
end
