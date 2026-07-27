# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../support/integration_helper"

class TestHrisIntegration < Minitest::Test
  include TestSupport::Integration

  def client
    @client ||= integration_client("hris")
  end

  def test_account_details_retrieve
    details = client.hris.account_details.retrieve

    refute_nil details
    refute_nil details.id
  end

  def test_groups_list
    smoke_list(client.hris.groups.list(page_size: MAX_ITEMS))
  end

  def test_groups_list_and_retrieve
    smoke_list_and_retrieve(client.hris.groups.list(page_size: MAX_ITEMS)) do |id|
      client.hris.groups.retrieve(id: id)
    end
  end

  def test_employees_list
    smoke_list(client.hris.employees.list(page_size: MAX_ITEMS))
  end

  def test_employees_list_and_retrieve
    smoke_list_and_retrieve(client.hris.employees.list(page_size: MAX_ITEMS)) do |id|
      client.hris.employees.retrieve(id: id)
    end
  end

  def test_employments_list
    smoke_list(client.hris.employments.list(page_size: MAX_ITEMS))
  end

  def test_companies_list
    smoke_list(client.hris.companies.list(page_size: MAX_ITEMS))
  end

  def test_locations_list
    smoke_list(client.hris.locations.list(page_size: MAX_ITEMS))
  end

  def test_teams_list
    smoke_list(client.hris.teams.list(page_size: MAX_ITEMS))
  end

  def test_time_off_list
    smoke_list(client.hris.time_off.list(page_size: MAX_ITEMS))
  end

  def test_employees_list_with_expand
    page = client.hris.employees.list(
      page_size: MAX_ITEMS,
      expand: Merge::Hris::Employees::EmployeesListRequestExpand::EMPLOYMENTS
    )

    smoke_list(page)
  end

  def test_created_after_filter_narrows_results
    page = client.hris.employees.list(page_size: MAX_ITEMS, created_after: DateTime.parse("2100-01-01"))

    smoke_list(page)
    assert_empty page.results
  end
end
