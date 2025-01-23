# frozen_string_literal: true

require "date"
require_relative "viewer_team"
require_relative "viewer_user"
require "ostruct"
require "json"

module Merge
  module Ticketing
    # # The Viewer Object
    #  ### Description
    #  The `Viewer` object is used to represent a User or Team within a company.
    #  ### Usage Example
    #  TODO
    class Viewer
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Ticketing::ViewerTeam] The Team this Viewer belongs to.
      attr_reader :team
      # @return [Merge::Ticketing::ViewerUser] The User this Viewer belongs to.
      attr_reader :user
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] The datetime that this object was created by Merge.
      # @param modified_at [DateTime] The datetime that this object was modified by Merge.
      # @param team [Merge::Ticketing::ViewerTeam] The Team this Viewer belongs to.
      # @param user [Merge::Ticketing::ViewerUser] The User this Viewer belongs to.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::Viewer]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, team: OMIT, user: OMIT,
                     additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @team = team if team != OMIT
        @user = user if user != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "team": team,
          "user": user
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Viewer
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::Viewer]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["team"].nil?
          team = nil
        else
          team = parsed_json["team"].to_json
          team = Merge::Ticketing::ViewerTeam.from_json(json_object: team)
        end
        if parsed_json["user"].nil?
          user = nil
        else
          user = parsed_json["user"].to_json
          user = Merge::Ticketing::ViewerUser.from_json(json_object: user)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          team: team,
          user: user,
          additional_properties: struct
        )
      end

      # Serialize an instance of Viewer to a JSON object
      #
      # @return [String]
      def to_json(*_args)
        @_field_set&.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.team.nil? || Merge::Ticketing::ViewerTeam.validate_raw(obj: obj.team)
        obj.user.nil? || Merge::Ticketing::ViewerUser.validate_raw(obj: obj.user)
      end
    end
  end
end
