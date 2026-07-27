# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../support/integration_helper"

class TestCrmIntegration < Minitest::Test
  include TestSupport::Integration

  def client
    @client ||= integration_client("crm")
  end

  def test_account_details_retrieve
    details = client.crm.account_details.retrieve

    refute_nil details
    refute_nil details.id
  end

  def test_accounts_list
    smoke_list(client.crm.accounts.list(page_size: MAX_ITEMS))
  end

  def test_accounts_list_and_retrieve
    smoke_list_and_retrieve(client.crm.accounts.list(page_size: MAX_ITEMS)) do |id|
      client.crm.accounts.retrieve(id: id)
    end
  end

  def test_contacts_list
    smoke_list(client.crm.contacts.list(page_size: MAX_ITEMS))
  end

  def test_contacts_list_and_retrieve
    smoke_list_and_retrieve(client.crm.contacts.list(page_size: MAX_ITEMS)) do |id|
      client.crm.contacts.retrieve(id: id)
    end
  end

  def test_leads_list
    smoke_list(client.crm.leads.list(page_size: MAX_ITEMS))
  end

  def test_opportunities_list
    smoke_list(client.crm.opportunities.list(page_size: MAX_ITEMS))
  end

  def test_notes_list
    smoke_list(client.crm.notes.list(page_size: MAX_ITEMS))
  end

  def test_engagements_list
    smoke_list(client.crm.engagements.list(page_size: MAX_ITEMS))
  end

  def test_stages_list
    smoke_list(client.crm.stages.list(page_size: MAX_ITEMS))
  end

  def test_tasks_list
    smoke_list(client.crm.tasks.list(page_size: MAX_ITEMS))
  end

  def test_users_list
    smoke_list(client.crm.users.list(page_size: MAX_ITEMS))
  end
end
