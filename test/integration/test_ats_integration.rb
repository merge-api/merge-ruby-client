# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../support/integration_helper"

class TestAtsIntegration < Minitest::Test
  include TestSupport::Integration

  def client
    @client ||= integration_client("ats")
  end

  def test_account_details_retrieve
    details = client.ats.account_details.retrieve

    refute_nil details
    refute_nil details.id
  end

  def test_candidates_list
    smoke_list(client.ats.candidates.list(page_size: MAX_ITEMS))
  end

  def test_candidates_list_and_retrieve
    smoke_list_and_retrieve(client.ats.candidates.list(page_size: MAX_ITEMS)) do |id|
      client.ats.candidates.retrieve(id: id)
    end
  end

  def test_applications_list
    smoke_list(client.ats.applications.list(page_size: MAX_ITEMS))
  end

  def test_applications_list_and_retrieve
    smoke_list_and_retrieve(client.ats.applications.list(page_size: MAX_ITEMS)) do |id|
      client.ats.applications.retrieve(id: id)
    end
  end

  def test_jobs_list
    smoke_list(client.ats.jobs.list(page_size: MAX_ITEMS))
  end

  def test_interviews_list
    smoke_list(client.ats.interviews.list(page_size: MAX_ITEMS))
  end

  def test_offers_list
    smoke_list(client.ats.offers.list(page_size: MAX_ITEMS))
  end

  def test_scorecards_list
    smoke_list(client.ats.scorecards.list(page_size: MAX_ITEMS))
  end

  def test_departments_list
    smoke_list(client.ats.departments.list(page_size: MAX_ITEMS))
  end

  def test_offices_list
    smoke_list(client.ats.offices.list(page_size: MAX_ITEMS))
  end

  def test_users_list
    smoke_list(client.ats.users.list(page_size: MAX_ITEMS))
  end
end
