# frozen_string_literal: true

require "dotenv/load"
require_relative "test_helper"
require "async"

# Test the Merge module
class TestMerge < Minitest::Test
  # Load in the environment variables
  config = File.absolute_path(File.join(File.expand_path(__FILE__), "..", ".env"))
  Dotenv.load(config)

  # Set some class vars
  @@ats_at = ENV["MERGE_ATS_ACCOUNT_TOKEN"]
  @@ats_id = ENV["MERGE_ATS_ACCOUNT_ID"]
  @@hris_at = ENV["MERGE_HRIS_ACCOUNT_TOKEN"]
  @@hris_id = ENV["MERGE_HRIS_ACCOUNT_ID"]
  @@merge = Merge::Client.new(
    api_key: ENV["MERGE_API_KEY"],
    account_token: @@ats_at
  )
  def test_retrieve_account_details
    ad = @@merge.ats.account_details.retrieve
    assert !ad.nil?
    assert ad.id == @@ats_id

    hris_ad = @@merge.hris.account_details.retrieve(request_options: Merge::RequestOptions.new(account_token: @@hris_at))
    assert !hris_ad.nil?
    assert hris_ad.id == @@hris_id
  end

  def test_unauthorized
    client = Merge::Client.new(api_key: "invalid_key")
    client.ats.account_details.retrieve
  rescue StandardError => e
    assert e.response[:status] == 401
  end

  def test_invalid_key
    client = Merge::Client.new(api_key: "invalid key with spaces")
    client.ats.account_details.retrieve
  rescue StandardError => e
    assert e.response[:status] == 400
  end

  def test_public_token_not_found
    @@merge.ats.account_token.retrieve(public_token: "123123")
  rescue StandardError => e
    assert e.response[:status] == 404
  end

  def test_create_link_token
    lt_response = @@merge.ats.link_token.create(
      end_user_email_address: "john.smith@gmail.com",
      end_user_organization_name: "acme",
      end_user_origin_id: "1234",
      categories: [Merge::Ats::CategoriesEnum::ATS],
      link_expiry_mins: 30
    )
    assert !lt_response.nil?
    assert !lt_response.link_token.empty?
  end

  def test_get_employees
    employees = @@merge.hris.employees.list(request_options: Merge::RequestOptions.new(account_token: @@hris_at))
    assert !employees.nil?
    assert !employees.results.nil?
    assert !employees.results.empty?

    employees = @@merge.hris.employees.list(created_after: DateTime.parse("2030-01-01"),
                                            request_options: Merge::RequestOptions.new(account_token: @@hris_at))
    assert !employees.nil?
    assert !employees.results.nil?
    assert employees.results.empty?
  end

  def test_get_candidates
    candidates = @@merge.ats.candidates.list
    assert !candidates.nil?
    assert !candidates.results.nil?
    assert !candidates.results.empty?

    idx = 0
    candidates.results.each_with_index.map do |candidate, i|
      assert !candidate.id.nil?
      retrieved = @@merge.ats.candidates.retrieve(id: candidate.id)
      assert retrieved.id == candidate.id
      idx = i if !candidate.first_name.nil? && !candidate.last_name.nil?
    end

    first_candidate = candidates.results[idx]
    filtered = @@merge.ats.candidates.list(
      first_name: first_candidate.first_name,
      last_name: first_candidate.last_name
    )
    assert !filtered.nil?
    assert !filtered.results.nil?
    assert filtered.results.length >= 1
    assert filtered.results.length <= candidates.results.length
  end

  # def test_async_client
  # async_client = Merge::AsyncClient.new(
  #   api_key: ENV["MERGE_API_KEY"],
  #   account_token: @@ats_at
  # )
  # ad_async = async_client.ats.account_details.retrieve
  # assert ad_async.instance_of?(Async::Task)
  # assert ad_async.wait.account_type == "TEST"

  # assert_raises(Exception) { client.ats.account_details.retrieve(request_options: Merge::RequestOptions.new(account_token: "invalid_token")) }
  # end
end
