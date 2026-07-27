# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../support/integration_helper"

class TestTicketingIntegration < Minitest::Test
  include TestSupport::Integration

  def client
    @client ||= integration_client("ticketing")
  end

  def test_account_details_retrieve
    details = client.ticketing.account_details.retrieve

    refute_nil details
    refute_nil details.id
  end

  def test_tickets_list
    smoke_list(client.ticketing.tickets.list(page_size: MAX_ITEMS))
  end

  def test_tickets_list_and_retrieve
    smoke_list_and_retrieve(client.ticketing.tickets.list(page_size: MAX_ITEMS)) do |id|
      client.ticketing.tickets.retrieve(id: id)
    end
  end

  def test_collections_list
    smoke_list(client.ticketing.collections.list(page_size: MAX_ITEMS))
  end

  def test_comments_list
    smoke_list(client.ticketing.comments.list(page_size: MAX_ITEMS))
  end

  def test_contacts_list
    smoke_list(client.ticketing.contacts.list(page_size: MAX_ITEMS))
  end

  def test_projects_list
    smoke_list(client.ticketing.projects.list(page_size: MAX_ITEMS))
  end

  def test_roles_list
    smoke_list(client.ticketing.roles.list(page_size: MAX_ITEMS))
  end

  def test_tags_list
    smoke_list(client.ticketing.tags.list(page_size: MAX_ITEMS))
  end

  def test_teams_list
    smoke_list(client.ticketing.teams.list(page_size: MAX_ITEMS))
  end

  def test_users_list
    smoke_list(client.ticketing.users.list(page_size: MAX_ITEMS))
  end
end
