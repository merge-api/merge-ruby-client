# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../support/fake_conn"

class TestRequestOptions < Minitest::Test
  include TestSupport

  def test_api_key_is_sent_as_bearer_authorization_header
    request_client, conn = stub_request_client(api_key: "test-key")

    Merge::Hris::GroupsClient.new(request_client: request_client).list

    assert_equal "Bearer test-key", conn.last_request.header("Authorization")
  end

  def test_constructor_account_token_is_sent_as_header
    request_client, conn = stub_request_client(api_key: "test-key", account_token: "acct-123")

    Merge::Hris::GroupsClient.new(request_client: request_client).list

    assert_equal "acct-123", conn.last_request.header("X-Account-Token")
  end

  def test_request_options_account_token_overrides_constructor_token
    request_client, conn = stub_request_client(api_key: "test-key", account_token: "acct-123")
    options = Merge::RequestOptions.new(account_token: "acct-override")

    Merge::Hris::GroupsClient.new(request_client: request_client).list(request_options: options)

    assert_equal "acct-override", conn.last_request.header("X-Account-Token")
  end

  def test_sdk_identification_headers_are_sent
    request_client, conn = stub_request_client(api_key: "test-key")

    Merge::Hris::GroupsClient.new(request_client: request_client).list

    assert_equal "Ruby", conn.last_request.header("X-Fern-Language")
    assert_equal "merge_ruby_client", conn.last_request.header("X-Fern-SDK-Name")
  end

  def test_additional_headers_are_merged_into_request
    request_client, conn = stub_request_client(api_key: "test-key")
    options = Merge::RequestOptions.new(additional_headers: { "X-Custom-Header" => "custom-value" })

    Merge::Hris::GroupsClient.new(request_client: request_client).list(request_options: options)

    assert_equal "custom-value", conn.last_request.header("X-Custom-Header")
  end

  def test_additional_query_parameters_are_merged_into_request
    request_client, conn = stub_request_client(api_key: "test-key")
    options = Merge::RequestOptions.new(additional_query_parameters: { "custom_param" => "custom-value" })

    Merge::Hris::GroupsClient.new(request_client: request_client).list(request_options: options)

    assert_equal "custom-value", conn.last_request.params["custom_param"]
  end

  def test_nil_query_parameters_are_omitted
    request_client, conn = stub_request_client(api_key: "test-key")

    Merge::Hris::GroupsClient.new(request_client: request_client).list(page_size: 10)

    params = conn.last_request.params
    assert_equal 10, params[:page_size]
    refute params.key?(:cursor)
    refute params.key?(:names)
  end

  def test_timeout_from_request_options_is_applied
    request_client, conn = stub_request_client(api_key: "test-key")
    options = Merge::RequestOptions.new(timeout_in_seconds: 42)

    Merge::Hris::GroupsClient.new(request_client: request_client).list(request_options: options)

    assert_equal 42, conn.last_request.options.timeout
  end
end
