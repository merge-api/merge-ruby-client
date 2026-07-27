# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../support/integration_helper"

class TestFilestorageIntegration < Minitest::Test
  include TestSupport::Integration

  def client
    @client ||= integration_client("filestorage")
  end

  def test_account_details_retrieve
    details = client.filestorage.account_details.retrieve

    refute_nil details
    refute_nil details.id
  end

  def test_files_list
    smoke_list(client.filestorage.files.list(page_size: MAX_ITEMS))
  end

  def test_files_list_and_retrieve
    smoke_list_and_retrieve(client.filestorage.files.list(page_size: MAX_ITEMS)) do |id|
      client.filestorage.files.retrieve(id: id)
    end
  end

  def test_folders_list
    smoke_list(client.filestorage.folders.list(page_size: MAX_ITEMS))
  end

  def test_folders_list_and_retrieve
    smoke_list_and_retrieve(client.filestorage.folders.list(page_size: MAX_ITEMS)) do |id|
      client.filestorage.folders.retrieve(id: id)
    end
  end

  def test_drives_list
    smoke_list(client.filestorage.drives.list(page_size: MAX_ITEMS))
  end

  def test_groups_list
    smoke_list(client.filestorage.groups.list(page_size: MAX_ITEMS))
  end

  def test_users_list
    smoke_list(client.filestorage.users.list(page_size: MAX_ITEMS))
  end
end
