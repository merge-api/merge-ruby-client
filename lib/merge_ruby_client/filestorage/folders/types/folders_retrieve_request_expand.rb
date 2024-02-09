# frozen_string_literal: true

module Merge
  module Filestorage
    class Folders
      # @type [FOLDERS_RETRIEVE_REQUEST_EXPAND]
      FOLDERS_RETRIEVE_REQUEST_EXPAND = {
        drive: "drive",
        parent_folder: "parent_folder",
        parent_folder_drive: "parent_folder,drive",
        permissions: "permissions",
        permissions_drive: "permissions,drive",
        permissions_parent_folder: "permissions,parent_folder",
        permissions_parent_folder_drive: "permissions,parent_folder,drive"
      }.freeze
    end
  end
end
