# frozen_string_literal: true

module Merge
  module Ticketing
    class Tickets
      # @type [TICKETS_LIST_REQUEST_EXPAND]
      TICKETS_LIST_REQUEST_EXPAND = {
        account: "account",
        account_contact: "account,contact",
        account_contact_creator: "account,contact,creator",
        account_contact_creator_parent_ticket: "account,contact,creator,parent_ticket",
        account_contact_parent_ticket: "account,contact,parent_ticket",
        account_creator: "account,creator",
        account_creator_parent_ticket: "account,creator,parent_ticket",
        account_parent_ticket: "account,parent_ticket",
        assignees: "assignees",
        assignees_account: "assignees,account",
        assignees_account_contact: "assignees,account,contact",
        assignees_account_contact_creator: "assignees,account,contact,creator",
        assignees_account_contact_creator_parent_ticket: "assignees,account,contact,creator,parent_ticket",
        assignees_account_contact_parent_ticket: "assignees,account,contact,parent_ticket",
        assignees_account_creator: "assignees,account,creator",
        assignees_account_creator_parent_ticket: "assignees,account,creator,parent_ticket",
        assignees_account_parent_ticket: "assignees,account,parent_ticket",
        assignees_collections: "assignees,collections",
        assignees_collections_account: "assignees,collections,account",
        assignees_collections_account_contact: "assignees,collections,account,contact",
        assignees_collections_account_contact_creator: "assignees,collections,account,contact,creator",
        assignees_collections_account_contact_creator_parent_ticket: "assignees,collections,account,contact,creator,parent_ticket",
        assignees_collections_account_contact_parent_ticket: "assignees,collections,account,contact,parent_ticket",
        assignees_collections_account_creator: "assignees,collections,account,creator",
        assignees_collections_account_creator_parent_ticket: "assignees,collections,account,creator,parent_ticket",
        assignees_collections_account_parent_ticket: "assignees,collections,account,parent_ticket",
        assignees_collections_contact: "assignees,collections,contact",
        assignees_collections_contact_creator: "assignees,collections,contact,creator",
        assignees_collections_contact_creator_parent_ticket: "assignees,collections,contact,creator,parent_ticket",
        assignees_collections_contact_parent_ticket: "assignees,collections,contact,parent_ticket",
        assignees_collections_creator: "assignees,collections,creator",
        assignees_collections_creator_parent_ticket: "assignees,collections,creator,parent_ticket",
        assignees_collections_parent_ticket: "assignees,collections,parent_ticket",
        assignees_contact: "assignees,contact",
        assignees_contact_creator: "assignees,contact,creator",
        assignees_contact_creator_parent_ticket: "assignees,contact,creator,parent_ticket",
        assignees_contact_parent_ticket: "assignees,contact,parent_ticket",
        assignees_creator: "assignees,creator",
        assignees_creator_parent_ticket: "assignees,creator,parent_ticket",
        assignees_parent_ticket: "assignees,parent_ticket",
        attachments: "attachments",
        attachments_account: "attachments,account",
        attachments_account_contact: "attachments,account,contact",
        attachments_account_contact_creator: "attachments,account,contact,creator",
        attachments_account_contact_creator_parent_ticket: "attachments,account,contact,creator,parent_ticket",
        attachments_account_contact_parent_ticket: "attachments,account,contact,parent_ticket",
        attachments_account_creator: "attachments,account,creator",
        attachments_account_creator_parent_ticket: "attachments,account,creator,parent_ticket",
        attachments_account_parent_ticket: "attachments,account,parent_ticket",
        attachments_assignees: "attachments,assignees",
        attachments_assignees_account: "attachments,assignees,account",
        attachments_assignees_account_contact: "attachments,assignees,account,contact",
        attachments_assignees_account_contact_creator: "attachments,assignees,account,contact,creator",
        attachments_assignees_account_contact_creator_parent_ticket: "attachments,assignees,account,contact,creator,parent_ticket",
        attachments_assignees_account_contact_parent_ticket: "attachments,assignees,account,contact,parent_ticket",
        attachments_assignees_account_creator: "attachments,assignees,account,creator",
        attachments_assignees_account_creator_parent_ticket: "attachments,assignees,account,creator,parent_ticket",
        attachments_assignees_account_parent_ticket: "attachments,assignees,account,parent_ticket",
        attachments_assignees_collections: "attachments,assignees,collections",
        attachments_assignees_collections_account: "attachments,assignees,collections,account",
        attachments_assignees_collections_account_contact: "attachments,assignees,collections,account,contact",
        attachments_assignees_collections_account_contact_creator: "attachments,assignees,collections,account,contact,creator",
        attachments_assignees_collections_account_contact_creator_parent_ticket: "attachments,assignees,collections,account,contact,creator,parent_ticket",
        attachments_assignees_collections_account_contact_parent_ticket: "attachments,assignees,collections,account,contact,parent_ticket",
        attachments_assignees_collections_account_creator: "attachments,assignees,collections,account,creator",
        attachments_assignees_collections_account_creator_parent_ticket: "attachments,assignees,collections,account,creator,parent_ticket",
        attachments_assignees_collections_account_parent_ticket: "attachments,assignees,collections,account,parent_ticket",
        attachments_assignees_collections_contact: "attachments,assignees,collections,contact",
        attachments_assignees_collections_contact_creator: "attachments,assignees,collections,contact,creator",
        attachments_assignees_collections_contact_creator_parent_ticket: "attachments,assignees,collections,contact,creator,parent_ticket",
        attachments_assignees_collections_contact_parent_ticket: "attachments,assignees,collections,contact,parent_ticket",
        attachments_assignees_collections_creator: "attachments,assignees,collections,creator",
        attachments_assignees_collections_creator_parent_ticket: "attachments,assignees,collections,creator,parent_ticket",
        attachments_assignees_collections_parent_ticket: "attachments,assignees,collections,parent_ticket",
        attachments_assignees_contact: "attachments,assignees,contact",
        attachments_assignees_contact_creator: "attachments,assignees,contact,creator",
        attachments_assignees_contact_creator_parent_ticket: "attachments,assignees,contact,creator,parent_ticket",
        attachments_assignees_contact_parent_ticket: "attachments,assignees,contact,parent_ticket",
        attachments_assignees_creator: "attachments,assignees,creator",
        attachments_assignees_creator_parent_ticket: "attachments,assignees,creator,parent_ticket",
        attachments_assignees_parent_ticket: "attachments,assignees,parent_ticket",
        attachments_collections: "attachments,collections",
        attachments_collections_account: "attachments,collections,account",
        attachments_collections_account_contact: "attachments,collections,account,contact",
        attachments_collections_account_contact_creator: "attachments,collections,account,contact,creator",
        attachments_collections_account_contact_creator_parent_ticket: "attachments,collections,account,contact,creator,parent_ticket",
        attachments_collections_account_contact_parent_ticket: "attachments,collections,account,contact,parent_ticket",
        attachments_collections_account_creator: "attachments,collections,account,creator",
        attachments_collections_account_creator_parent_ticket: "attachments,collections,account,creator,parent_ticket",
        attachments_collections_account_parent_ticket: "attachments,collections,account,parent_ticket",
        attachments_collections_contact: "attachments,collections,contact",
        attachments_collections_contact_creator: "attachments,collections,contact,creator",
        attachments_collections_contact_creator_parent_ticket: "attachments,collections,contact,creator,parent_ticket",
        attachments_collections_contact_parent_ticket: "attachments,collections,contact,parent_ticket",
        attachments_collections_creator: "attachments,collections,creator",
        attachments_collections_creator_parent_ticket: "attachments,collections,creator,parent_ticket",
        attachments_collections_parent_ticket: "attachments,collections,parent_ticket",
        attachments_contact: "attachments,contact",
        attachments_contact_creator: "attachments,contact,creator",
        attachments_contact_creator_parent_ticket: "attachments,contact,creator,parent_ticket",
        attachments_contact_parent_ticket: "attachments,contact,parent_ticket",
        attachments_creator: "attachments,creator",
        attachments_creator_parent_ticket: "attachments,creator,parent_ticket",
        attachments_parent_ticket: "attachments,parent_ticket",
        collections: "collections",
        collections_account: "collections,account",
        collections_account_contact: "collections,account,contact",
        collections_account_contact_creator: "collections,account,contact,creator",
        collections_account_contact_creator_parent_ticket: "collections,account,contact,creator,parent_ticket",
        collections_account_contact_parent_ticket: "collections,account,contact,parent_ticket",
        collections_account_creator: "collections,account,creator",
        collections_account_creator_parent_ticket: "collections,account,creator,parent_ticket",
        collections_account_parent_ticket: "collections,account,parent_ticket",
        collections_contact: "collections,contact",
        collections_contact_creator: "collections,contact,creator",
        collections_contact_creator_parent_ticket: "collections,contact,creator,parent_ticket",
        collections_contact_parent_ticket: "collections,contact,parent_ticket",
        collections_creator: "collections,creator",
        collections_creator_parent_ticket: "collections,creator,parent_ticket",
        collections_parent_ticket: "collections,parent_ticket",
        contact: "contact",
        contact_creator: "contact,creator",
        contact_creator_parent_ticket: "contact,creator,parent_ticket",
        contact_parent_ticket: "contact,parent_ticket",
        creator: "creator",
        creator_parent_ticket: "creator,parent_ticket",
        parent_ticket: "parent_ticket"
      }.freeze
    end
  end
end
