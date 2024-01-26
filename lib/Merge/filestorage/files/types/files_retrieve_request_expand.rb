# frozen_string_literal: true

module Merge
  module Filestorage
    module Files
      # @type [Hash{String => String}]
      FILES_RETRIEVE_REQUEST_EXPAND = {
        drive: "drive",
        folder: "folder",
        folder_drive: "folder,drive",
        permissions: "permissions",
        permissions_drive: "permissions,drive",
        permissions_folder: "permissions,folder",
        permissions_folder_drive: "permissions,folder,drive"
      }.frozen
    end
  end
end
