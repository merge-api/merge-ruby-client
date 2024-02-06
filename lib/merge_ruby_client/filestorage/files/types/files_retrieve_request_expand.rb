# frozen_string_literal: true

module Merge
  module Filestorage
    class Files
      # @type [FILES_RETRIEVE_REQUEST_EXPAND]
      FILES_RETRIEVE_REQUEST_EXPAND = {
        drive: "drive",
        folder: "folder",
        folder_drive: "folder,drive",
        permissions: "permissions",
        permissions_drive: "permissions,drive",
        permissions_folder: "permissions,folder",
        permissions_folder_drive: "permissions,folder,drive"
      }.freeze
    end
  end
end
