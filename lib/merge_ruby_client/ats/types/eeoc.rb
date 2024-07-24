# frozen_string_literal: true

require "date"
require_relative "eeoc_candidate"
require_relative "race_enum"
require_relative "gender_enum"
require_relative "veteran_status_enum"
require_relative "disability_status_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The EEOC Object
    #  ### Description
    #  The `EEOC` object is used to represent the Equal Employment Opportunity
    #  Commission information for a candidate (race, gender, veteran status, disability
    #  status).
    #  ### Usage Example
    #  Fetch from the `LIST EEOCs` endpoint and filter by `candidate` to show all EEOC
    #  information for a candidate.
    class Eeoc
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Ats::EeocCandidate] The candidate being represented.
      attr_reader :candidate
      # @return [DateTime] When the information was submitted.
      attr_reader :submitted_at
      # @return [Merge::Ats::RaceEnum] The candidate's race.
      #  - `AMERICAN_INDIAN_OR_ALASKAN_NATIVE` - AMERICAN_INDIAN_OR_ALASKAN_NATIVE
      #  - `ASIAN` - ASIAN
      #  - `BLACK_OR_AFRICAN_AMERICAN` - BLACK_OR_AFRICAN_AMERICAN
      #  - `HISPANIC_OR_LATINO` - HISPANIC_OR_LATINO
      #  - `WHITE` - WHITE
      #  - `NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER` -
      #  NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER
      #  - `TWO_OR_MORE_RACES` - TWO_OR_MORE_RACES
      #  - `DECLINE_TO_SELF_IDENTIFY` - DECLINE_TO_SELF_IDENTIFY
      attr_reader :race
      # @return [Merge::Ats::GenderEnum] The candidate's gender.
      #  - `MALE` - MALE
      #  - `FEMALE` - FEMALE
      #  - `NON-BINARY` - NON-BINARY
      #  - `OTHER` - OTHER
      #  - `DECLINE_TO_SELF_IDENTIFY` - DECLINE_TO_SELF_IDENTIFY
      attr_reader :gender
      # @return [Merge::Ats::VeteranStatusEnum] The candidate's veteran status.
      #  - `I_AM_NOT_A_PROTECTED_VETERAN` - I_AM_NOT_A_PROTECTED_VETERAN
      #  - `I_IDENTIFY_AS_ONE_OR_MORE_OF_THE_CLASSIFICATIONS_OF_A_PROTECTED_VETERAN` -
      #  I_IDENTIFY_AS_ONE_OR_MORE_OF_THE_CLASSIFICATIONS_OF_A_PROTECTED_VETERAN
      #  - `I_DONT_WISH_TO_ANSWER` - I_DONT_WISH_TO_ANSWER
      attr_reader :veteran_status
      # @return [Merge::Ats::DisabilityStatusEnum] The candidate's disability status.
      #  - `YES_I_HAVE_A_DISABILITY_OR_PREVIOUSLY_HAD_A_DISABILITY` -
      #  YES_I_HAVE_A_DISABILITY_OR_PREVIOUSLY_HAD_A_DISABILITY
      #  - `NO_I_DONT_HAVE_A_DISABILITY` - NO_I_DONT_HAVE_A_DISABILITY
      #  - `I_DONT_WISH_TO_ANSWER` - I_DONT_WISH_TO_ANSWER
      attr_reader :disability_status
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Ats::RemoteData>]
      attr_reader :remote_data
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
      # @param candidate [Merge::Ats::EeocCandidate] The candidate being represented.
      # @param submitted_at [DateTime] When the information was submitted.
      # @param race [Merge::Ats::RaceEnum] The candidate's race.
      #  - `AMERICAN_INDIAN_OR_ALASKAN_NATIVE` - AMERICAN_INDIAN_OR_ALASKAN_NATIVE
      #  - `ASIAN` - ASIAN
      #  - `BLACK_OR_AFRICAN_AMERICAN` - BLACK_OR_AFRICAN_AMERICAN
      #  - `HISPANIC_OR_LATINO` - HISPANIC_OR_LATINO
      #  - `WHITE` - WHITE
      #  - `NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER` -
      #  NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER
      #  - `TWO_OR_MORE_RACES` - TWO_OR_MORE_RACES
      #  - `DECLINE_TO_SELF_IDENTIFY` - DECLINE_TO_SELF_IDENTIFY
      # @param gender [Merge::Ats::GenderEnum] The candidate's gender.
      #  - `MALE` - MALE
      #  - `FEMALE` - FEMALE
      #  - `NON-BINARY` - NON-BINARY
      #  - `OTHER` - OTHER
      #  - `DECLINE_TO_SELF_IDENTIFY` - DECLINE_TO_SELF_IDENTIFY
      # @param veteran_status [Merge::Ats::VeteranStatusEnum] The candidate's veteran status.
      #  - `I_AM_NOT_A_PROTECTED_VETERAN` - I_AM_NOT_A_PROTECTED_VETERAN
      #  - `I_IDENTIFY_AS_ONE_OR_MORE_OF_THE_CLASSIFICATIONS_OF_A_PROTECTED_VETERAN` -
      #  I_IDENTIFY_AS_ONE_OR_MORE_OF_THE_CLASSIFICATIONS_OF_A_PROTECTED_VETERAN
      #  - `I_DONT_WISH_TO_ANSWER` - I_DONT_WISH_TO_ANSWER
      # @param disability_status [Merge::Ats::DisabilityStatusEnum] The candidate's disability status.
      #  - `YES_I_HAVE_A_DISABILITY_OR_PREVIOUSLY_HAD_A_DISABILITY` -
      #  YES_I_HAVE_A_DISABILITY_OR_PREVIOUSLY_HAD_A_DISABILITY
      #  - `NO_I_DONT_HAVE_A_DISABILITY` - NO_I_DONT_HAVE_A_DISABILITY
      #  - `I_DONT_WISH_TO_ANSWER` - I_DONT_WISH_TO_ANSWER
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::Eeoc]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, candidate: OMIT,
                     submitted_at: OMIT, race: OMIT, gender: OMIT, veteran_status: OMIT, disability_status: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @candidate = candidate if candidate != OMIT
        @submitted_at = submitted_at if submitted_at != OMIT
        @race = race if race != OMIT
        @gender = gender if gender != OMIT
        @veteran_status = veteran_status if veteran_status != OMIT
        @disability_status = disability_status if disability_status != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "candidate": candidate,
          "submitted_at": submitted_at,
          "race": race,
          "gender": gender,
          "veteran_status": veteran_status,
          "disability_status": disability_status,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Eeoc
      #
      # @param json_object [String]
      # @return [Merge::Ats::Eeoc]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["candidate"].nil?
          candidate = nil
        else
          candidate = parsed_json["candidate"].to_json
          candidate = Merge::Ats::EeocCandidate.from_json(json_object: candidate)
        end
        submitted_at = (DateTime.parse(parsed_json["submitted_at"]) unless parsed_json["submitted_at"].nil?)
        race = parsed_json["race"]
        gender = parsed_json["gender"]
        veteran_status = parsed_json["veteran_status"]
        disability_status = parsed_json["disability_status"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Ats::RemoteData.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          candidate: candidate,
          submitted_at: submitted_at,
          race: race,
          gender: gender,
          veteran_status: veteran_status,
          disability_status: disability_status,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Eeoc to a JSON object
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
        obj.candidate.nil? || Merge::Ats::EeocCandidate.validate_raw(obj: obj.candidate)
        obj.submitted_at&.is_a?(DateTime) != false || raise("Passed value for field obj.submitted_at is not the expected type, validation failed.")
        obj.race&.is_a?(Merge::Ats::RaceEnum) != false || raise("Passed value for field obj.race is not the expected type, validation failed.")
        obj.gender&.is_a?(Merge::Ats::GenderEnum) != false || raise("Passed value for field obj.gender is not the expected type, validation failed.")
        obj.veteran_status&.is_a?(Merge::Ats::VeteranStatusEnum) != false || raise("Passed value for field obj.veteran_status is not the expected type, validation failed.")
        obj.disability_status&.is_a?(Merge::Ats::DisabilityStatusEnum) != false || raise("Passed value for field obj.disability_status is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
