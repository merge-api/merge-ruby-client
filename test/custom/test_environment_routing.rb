# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../support/fake_conn"

class TestEnvironmentRouting < Minitest::Test
  include TestSupport

  def list_groups(**client_options)
    request_client, conn = stub_request_client(**client_options)
    Merge::Hris::GroupsClient.new(request_client: request_client).list
    conn.last_request.requested_url
  end

  def test_default_environment_is_production
    url = list_groups(api_key: "test-key")

    assert_equal "https://api.merge.dev/api/hris/v1/groups", url
  end

  def test_sandbox_environment_routes_to_sandbox_host
    url = list_groups(api_key: "test-key", environment: Merge::Environment::SANDBOX)

    assert_equal "https://api-sandbox.merge.dev/api/hris/v1/groups", url
  end

  def test_production_eu_environment_routes_to_eu_host
    url = list_groups(api_key: "test-key", environment: Merge::Environment::PRODUCTION_EU)

    assert_equal "https://api-eu.merge.dev/api/hris/v1/groups", url
  end

  def test_environment_takes_precedence_over_constructor_base_url
    url = list_groups(api_key: "test-key", base_url: "https://custom.example.com/api")

    assert_equal "https://api.merge.dev/api/hris/v1/groups", url
  end

  def test_base_url_is_used_when_environment_is_nil
    url = list_groups(api_key: "test-key", base_url: "https://custom.example.com/api", environment: nil)

    assert_equal "https://custom.example.com/api/hris/v1/groups", url
  end

  def test_request_options_base_url_overrides_environment
    request_client, conn = stub_request_client(api_key: "test-key")
    options = Merge::RequestOptions.new(base_url: "https://per-request.example.com/api")

    Merge::Hris::GroupsClient.new(request_client: request_client).list(request_options: options)

    assert_equal "https://per-request.example.com/api/hris/v1/groups", conn.last_request.requested_url
  end
end
