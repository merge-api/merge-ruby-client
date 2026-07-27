# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../support/fake_conn"

class TestExpandQueryParam < Minitest::Test
  include TestSupport

  def list_employees(**list_options)
    request_client, conn = stub_request_client(api_key: "test-key")
    Merge::Hris::EmployeesClient.new(request_client: request_client).list(**list_options)
    conn.last_request
  end

  def test_single_relation_expand_is_sent_as_string
    request = list_employees(expand: Merge::Hris::Employees::EmployeesListRequestExpand::EMPLOYMENTS)

    assert_equal "employments", request.params[:expand]
  end

  def test_multi_relation_expand_is_sent_as_single_comma_separated_string
    request = list_employees(expand: Merge::Hris::Employees::EmployeesListRequestExpand::EMPLOYMENTS_GROUPS)

    assert_equal "employments,groups", request.params[:expand]
  end

  def test_expand_is_never_sent_as_repeated_parameter
    request = list_employees(expand: Merge::Hris::Employees::EmployeesListRequestExpand::EMPLOYMENTS_GROUPS)

    assert_kind_of String, request.params[:expand]
  end

  def test_expand_is_omitted_when_not_requested
    request = list_employees

    refute request.params.key?(:expand)
  end

  def test_expand_constants_are_plain_comma_separated_strings
    expand = Merge::Hris::Employees::EmployeesListRequestExpand

    assert_equal "company", expand::COMPANY
    assert_equal "company,pay_group", expand::COMPANY_PAY_GROUP
    assert_equal "employments,groups,company", expand::EMPLOYMENTS_GROUPS_COMPANY
  end
end
