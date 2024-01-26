# frozen_string_literal: true

module Merge
  module Filestorage
    module Folders
      # @type [Hash{String => String}]
      FOLDERS_LIST_REQUEST_EXPAND = {
        drive: "drive",
        parent_folder: "parent_folder",
        parent_folder_drive: "parent_folder,drive",
        permissions: "permissions",
        permissions_drive: "permissions,drive",
        permissions_parent_folder: "permissions,parent_folder",
        permissions_parent_folder_drive: "permissions,parent_folder,drive"
      }.frozen
    end
  end
end
