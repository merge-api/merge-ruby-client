# frozen_string_literal: true
require_relative "eeoc_candidate"
require "date"
require_relative "eeoc_race"
require_relative "eeoc_gender"
require_relative "eeoc_veteran_status"
require_relative "eeoc_disability_status"
require "date"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Ats
    # # The EEOC Object 
### Description

The `EEOC` object is used to represent the Equal Employment Opportunity Commission information for a candidate (race, gender, veteran status, disability status).

### Usage Example

Fetch from the `LIST EEOCs` endpoint and filter by `candidate` to show all EEOC information for a candidate.
    class Eeoc
      attr_reader :id, :remote_id, :candidate, :submitted_at, :race, :gender, :veteran_status, :disability_status, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param candidate [Ats::EeocCandidate] The candidate being represented.
      # @param submitted_at [DateTime] When the information was submitted.
      # @param race [Ats::EeocRace] The candidate's race.  - `AMERICAN_INDIAN_OR_ALASKAN_NATIVE` - AMERICAN_INDIAN_OR_ALASKAN_NATIVE
- `ASIAN` - ASIAN
- `BLACK_OR_AFRICAN_AMERICAN` - BLACK_OR_AFRICAN_AMERICAN
- `HISPANIC_OR_LATINO` - HISPANIC_OR_LATINO
- `WHITE` - WHITE
- `NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER` - NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER
- `TWO_OR_MORE_RACES` - TWO_OR_MORE_RACES
- `DECLINE_TO_SELF_IDENTIFY` - DECLINE_TO_SELF_IDENTIFY
      # @param gender [Ats::EeocGender] The candidate's gender.  - `MALE` - MALE
- `FEMALE` - FEMALE
- `NON-BINARY` - NON-BINARY
- `OTHER` - OTHER
- `DECLINE_TO_SELF_IDENTIFY` - DECLINE_TO_SELF_IDENTIFY
      # @param veteran_status [Ats::EeocVeteranStatus] The candidate's veteran status.  - `I_AM_NOT_A_PROTECTED_VETERAN` - I_AM_NOT_A_PROTECTED_VETERAN
- `I_IDENTIFY_AS_ONE_OR_MORE_OF_THE_CLASSIFICATIONS_OF_A_PROTECTED_VETERAN` - I_IDENTIFY_AS_ONE_OR_MORE_OF_THE_CLASSIFICATIONS_OF_A_PROTECTED_VETERAN
- `I_DONT_WISH_TO_ANSWER` - I_DONT_WISH_TO_ANSWER
      # @param disability_status [Ats::EeocDisabilityStatus] The candidate's disability status.  - `YES_I_HAVE_A_DISABILITY_OR_PREVIOUSLY_HAD_A_DISABILITY` - YES_I_HAVE_A_DISABILITY_OR_PREVIOUSLY_HAD_A_DISABILITY
- `NO_I_DONT_HAVE_A_DISABILITY` - NO_I_DONT_HAVE_A_DISABILITY
- `I_DONT_WISH_TO_ANSWER` - I_DONT_WISH_TO_ANSWER
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Ats::RemoteData>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::Eeoc]
      def initialize(id: nil, remote_id: nil, candidate: nil, submitted_at: nil, race: nil, gender: nil, veteran_status: nil, disability_status: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Ats::EeocCandidate] The candidate being represented.
        @candidate = candidate
        # @type [DateTime] When the information was submitted.
        @submitted_at = submitted_at
        # @type [Ats::EeocRace] The candidate's race. 
- `AMERICAN_INDIAN_OR_ALASKAN_NATIVE` - AMERICAN_INDIAN_OR_ALASKAN_NATIVE
- `ASIAN` - ASIAN
- `BLACK_OR_AFRICAN_AMERICAN` - BLACK_OR_AFRICAN_AMERICAN
- `HISPANIC_OR_LATINO` - HISPANIC_OR_LATINO
- `WHITE` - WHITE
- `NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER` - NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER
- `TWO_OR_MORE_RACES` - TWO_OR_MORE_RACES
- `DECLINE_TO_SELF_IDENTIFY` - DECLINE_TO_SELF_IDENTIFY
        @race = race
        # @type [Ats::EeocGender] The candidate's gender. 
- `MALE` - MALE
- `FEMALE` - FEMALE
- `NON-BINARY` - NON-BINARY
- `OTHER` - OTHER
- `DECLINE_TO_SELF_IDENTIFY` - DECLINE_TO_SELF_IDENTIFY
        @gender = gender
        # @type [Ats::EeocVeteranStatus] The candidate's veteran status. 
- `I_AM_NOT_A_PROTECTED_VETERAN` - I_AM_NOT_A_PROTECTED_VETERAN
- `I_IDENTIFY_AS_ONE_OR_MORE_OF_THE_CLASSIFICATIONS_OF_A_PROTECTED_VETERAN` - I_IDENTIFY_AS_ONE_OR_MORE_OF_THE_CLASSIFICATIONS_OF_A_PROTECTED_VETERAN
- `I_DONT_WISH_TO_ANSWER` - I_DONT_WISH_TO_ANSWER
        @veteran_status = veteran_status
        # @type [Ats::EeocDisabilityStatus] The candidate's disability status. 
- `YES_I_HAVE_A_DISABILITY_OR_PREVIOUSLY_HAD_A_DISABILITY` - YES_I_HAVE_A_DISABILITY_OR_PREVIOUSLY_HAD_A_DISABILITY
- `NO_I_DONT_HAVE_A_DISABILITY` - NO_I_DONT_HAVE_A_DISABILITY
- `I_DONT_WISH_TO_ANSWER` - I_DONT_WISH_TO_ANSWER
        @disability_status = disability_status
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}] 
        @field_mappings = field_mappings
        # @type [Array<Ats::RemoteData>] 
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of Eeoc
      #
      # @param json_object [JSON] 
      # @return [Ats::Eeoc]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct.id
        remote_id = struct.remote_id
        candidate = struct.candidate.to_h.to_json()
        candidate = Ats::EeocCandidate.from_json(json_object: candidate)
        submitted_at = DateTime.parse(struct.submitted_at)
        race = struct.race.to_h.to_json()
        race = Ats::EeocRace.from_json(json_object: race)
        gender = struct.gender.to_h.to_json()
        gender = Ats::EeocGender.from_json(json_object: gender)
        veteran_status = struct.veteran_status.to_h.to_json()
        veteran_status = Ats::EeocVeteranStatus.from_json(json_object: veteran_status)
        disability_status = struct.disability_status.to_h.to_json()
        disability_status = Ats::EeocDisabilityStatus.from_json(json_object: disability_status)
        remote_was_deleted = struct.remote_was_deleted
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data.map() do | v |
  v = v.to_h.to_json()
  Ats::RemoteData.from_json(json_object: v)
end
        new(id: id, remote_id: remote_id, candidate: candidate, submitted_at: submitted_at, race: race, gender: gender, veteran_status: veteran_status, disability_status: disability_status, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end
      # Serialize an instance of Eeoc to a JSON object
      #
      # @return [JSON]
      def to_json
        { "id": @id, "remote_id": @remote_id, "candidate": @candidate, "submitted_at": @submitted_at, "race": @race, "gender": @gender, "veteran_status": @veteran_status, "disability_status": @disability_status, "remote_was_deleted": @remote_was_deleted, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.candidate.nil?() || Ats::EeocCandidate.validate_raw(obj: obj.candidate)
        obj.submitted_at&.is_a?(DateTime) != false || raise("Passed value for field obj.submitted_at is not the expected type, validation failed.")
        obj.race.nil?() || Ats::EeocRace.validate_raw(obj: obj.race)
        obj.gender.nil?() || Ats::EeocGender.validate_raw(obj: obj.gender)
        obj.veteran_status.nil?() || Ats::EeocVeteranStatus.validate_raw(obj: obj.veteran_status)
        obj.disability_status.nil?() || Ats::EeocDisabilityStatus.validate_raw(obj: obj.disability_status)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end