# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../support/integration_helper"

class TestAccountingIntegration < Minitest::Test
  include TestSupport::Integration

  def client
    @client ||= integration_client("accounting")
  end

  def test_account_details_retrieve
    details = client.accounting.account_details.retrieve

    refute_nil details
    refute_nil details.id
  end

  def test_accounts_list
    smoke_list(client.accounting.accounts.list(page_size: MAX_ITEMS))
  end

  def test_accounts_list_and_retrieve
    smoke_list_and_retrieve(client.accounting.accounts.list(page_size: MAX_ITEMS)) do |id|
      client.accounting.accounts.retrieve(id: id)
    end
  end

  def test_invoices_list
    smoke_list(client.accounting.invoices.list(page_size: MAX_ITEMS))
  end

  def test_invoices_list_and_retrieve
    smoke_list_and_retrieve(client.accounting.invoices.list(page_size: MAX_ITEMS)) do |id|
      client.accounting.invoices.retrieve(id: id)
    end
  end

  def test_contacts_list
    smoke_list(client.accounting.contacts.list(page_size: MAX_ITEMS))
  end

  def test_payments_list
    smoke_list(client.accounting.payments.list(page_size: MAX_ITEMS))
  end

  def test_company_info_list
    smoke_list(client.accounting.company_info.list(page_size: MAX_ITEMS))
  end

  def test_items_list
    smoke_list(client.accounting.items.list(page_size: MAX_ITEMS))
  end

  def test_journal_entries_list
    smoke_list(client.accounting.journal_entries.list(page_size: MAX_ITEMS))
  end

  def test_transactions_list
    smoke_list(client.accounting.transactions.list(page_size: MAX_ITEMS))
  end

  def test_tracking_categories_list
    smoke_list(client.accounting.tracking_categories.list(page_size: MAX_ITEMS))
  end

  def test_tax_rates_list
    smoke_list(client.accounting.tax_rates.list(page_size: MAX_ITEMS))
  end
end
