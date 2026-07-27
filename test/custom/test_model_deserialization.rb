# frozen_string_literal: true

require_relative "../test_helper"

class TestModelDeserialization < Minitest::Test
  GROUP_PAYLOAD = {
    "id" => "134e0111-0f67-44f6-98f0-597000290bb3",
    "remote_id" => "800293",
    "created_at" => "2021-09-15T00:00:00Z",
    "modified_at" => "2021-10-16T00:00:00Z",
    "parent_group" => "2ef51b11-2c4e-4b02-8d1d-50592d9e96ef",
    "name" => "COST_CENTER_US",
    "type" => "COST_CENTER",
    "is_commonly_used_as_team" => true,
    "remote_was_deleted" => false
  }.freeze

  def test_scalar_fields_are_mapped
    group = Merge::Hris::Group.from_json(json_object: JSON.generate(GROUP_PAYLOAD))

    assert_equal "134e0111-0f67-44f6-98f0-597000290bb3", group.id
    assert_equal "800293", group.remote_id
    assert_equal "COST_CENTER_US", group.name
    assert_equal "2ef51b11-2c4e-4b02-8d1d-50592d9e96ef", group.parent_group
    assert group.is_commonly_used_as_team
    refute group.remote_was_deleted
  end

  def test_datetime_fields_are_parsed
    group = Merge::Hris::Group.from_json(json_object: JSON.generate(GROUP_PAYLOAD))

    assert_kind_of DateTime, group.created_at
    assert_kind_of DateTime, group.modified_at
    assert_equal 2021, group.created_at.year
    assert_equal 9, group.created_at.month
  end

  def test_missing_optional_fields_are_nil
    group = Merge::Hris::Group.from_json(json_object: JSON.generate({ "id" => "group-1" }))

    assert_equal "group-1", group.id
    assert_nil group.name
    assert_nil group.created_at
    assert_nil group.parent_group
  end

  def test_unknown_fields_are_exposed_via_additional_properties
    payload = GROUP_PAYLOAD.merge("group_url" => "https://www.workday.com/cost-center/800293")
    group = Merge::Hris::Group.from_json(json_object: JSON.generate(payload))

    assert_equal "https://www.workday.com/cost-center/800293", group.additional_properties.group_url
  end

  def test_unknown_fields_do_not_raise
    payload = GROUP_PAYLOAD.merge("a_field_added_later" => { "nested" => [1, 2, 3] })

    group = Merge::Hris::Group.from_json(json_object: JSON.generate(payload))

    assert_equal "134e0111-0f67-44f6-98f0-597000290bb3", group.id
  end

  def test_paginated_list_maps_results_to_models
    payload = {
      "next" => "cD0yMDIxLTAxLTA2",
      "previous" => nil,
      "results" => [GROUP_PAYLOAD]
    }

    page = Merge::Hris::PaginatedGroupList.from_json(json_object: JSON.generate(payload))

    assert_equal "cD0yMDIxLTAxLTA2", page.next_
    assert_nil page.previous
    assert_equal 1, page.results.length
    assert_kind_of Merge::Hris::Group, page.results.first
    assert_equal "COST_CENTER_US", page.results.first.name
  end

  def test_paginated_list_handles_empty_results
    page = Merge::Hris::PaginatedGroupList.from_json(json_object: JSON.generate({ "results" => [] }))

    assert_empty page.results
  end
end
