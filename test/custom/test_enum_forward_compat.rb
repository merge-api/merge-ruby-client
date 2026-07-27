# frozen_string_literal: true

require_relative "../test_helper"

class TestEnumForwardCompat < Minitest::Test
  def group_json(type)
    JSON.generate({ "id" => "group-1", "name" => "Engineering", "type" => type })
  end

  def test_known_enum_value_deserializes_to_its_string
    group = Merge::Hris::Group.from_json(json_object: group_json("DEPARTMENT"))

    assert_equal Merge::Hris::GroupTypeEnum::DEPARTMENT, group.type
  end

  def test_unknown_enum_value_does_not_raise
    group = Merge::Hris::Group.from_json(json_object: group_json("FUTURE_GROUP_TYPE"))

    assert_equal "FUTURE_GROUP_TYPE", group.type
  end

  def test_unknown_enum_value_survives_round_trip
    group = Merge::Hris::Group.from_json(json_object: group_json("FUTURE_GROUP_TYPE"))
    round_tripped = Merge::Hris::Group.from_json(json_object: group.to_json)

    assert_equal "FUTURE_GROUP_TYPE", round_tripped.type
  end

  def test_null_enum_value_is_nil
    group = Merge::Hris::Group.from_json(json_object: group_json(nil))

    assert_nil group.type
  end

  def test_enum_constants_are_plain_strings
    assert_equal "TEAM", Merge::Hris::GroupTypeEnum::TEAM
    assert_equal "COST_CENTER", Merge::Hris::GroupTypeEnum::COST_CENTER
    assert_equal "BUSINESS_UNIT", Merge::Hris::GroupTypeEnum::BUSINESS_UNIT
  end
end
