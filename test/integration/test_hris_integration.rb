# frozen_string_literal: true

require_relative "../test_helper"

class TestHrisIntegration < Minitest::Test
  MAX_ITEMS = 5

  def setup
    @api_key = ENV["MERGE_API_KEY"]
    @account_token = ENV["MERGE_HRIS_ACCOUNT_TOKEN"]

    return unless blank?(@api_key) || blank?(@account_token)

    skip("set MERGE_API_KEY and MERGE_HRIS_ACCOUNT_TOKEN to run HRIS integration tests")
  end

  def blank?(value)
    value.nil? || value.empty?
  end

  def client
    Merge::Client.new(api_key: @api_key, account_token: @account_token)
  end

  def test_account_details_retrieve
    details = client.hris.account_details.retrieve

    refute_nil details
    refute_nil details.id
  end

  def test_groups_list
    page = client.hris.groups.list(page_size: MAX_ITEMS)

    refute_nil page
    refute_nil page.results
  end

  def test_groups_list_and_retrieve
    page = client.hris.groups.list(page_size: MAX_ITEMS)
    first = page.results&.first

    skip("no groups available on this linked account") if first.nil?

    retrieved = client.hris.groups.retrieve(id: first.id)

    assert_equal first.id, retrieved.id
  end

  def test_employees_list
    page = client.hris.employees.list(page_size: MAX_ITEMS)

    refute_nil page
    refute_nil page.results
  end

  def test_employees_list_with_expand
    page = client.hris.employees.list(
      page_size: MAX_ITEMS,
      expand: Merge::Hris::Employees::EmployeesListRequestExpand::EMPLOYMENTS
    )

    refute_nil page
    refute_nil page.results
  end

  def test_created_after_filter_narrows_results
    page = client.hris.employees.list(page_size: MAX_ITEMS, created_after: DateTime.parse("2100-01-01"))

    refute_nil page
    assert_empty page.results.to_a
  end
end
