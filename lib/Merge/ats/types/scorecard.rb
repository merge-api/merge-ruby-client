# frozen_string_literal: true
require_relative "scorecard_application"
require_relative "scorecard_interview"
require_relative "scorecard_interviewer"
require "date"
require "date"
require_relative "scorecard_overall_recommendation"
require "date"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Ats
    # # The Scorecard Object 
### Description

The `Scorecard` object is used to represent an interviewer's candidate recommendation based on a particular interview.

### Usage Example

Fetch from the `LIST Scorecards` endpoint and filter by `application` to show all scorecard for an applicant.
    class Scorecard
      attr_reader :id, :remote_id, :application, :interview, :interviewer, :remote_created_at, :submitted_at, :overall_recommendation, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param application [Ats::ScorecardApplication] The application being scored.
      # @param interview [Ats::ScorecardInterview] The interview being scored.
      # @param interviewer [Ats::ScorecardInterviewer] The interviewer doing the scoring.
      # @param remote_created_at [DateTime] When the third party's scorecard was created.
      # @param submitted_at [DateTime] When the scorecard was submitted.
      # @param overall_recommendation [Ats::ScorecardOverallRecommendation] The inteviewer's recommendation.  - `DEFINITELY_NO` - DEFINITELY_NO
- `NO` - NO
- `YES` - YES
- `STRONG_YES` - STRONG_YES
- `NO_DECISION` - NO_DECISION
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Ats::RemoteData>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::Scorecard]
      def initialize(id: nil, remote_id: nil, application: nil, interview: nil, interviewer: nil, remote_created_at: nil, submitted_at: nil, overall_recommendation: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Ats::ScorecardApplication] The application being scored.
        @application = application
        # @type [Ats::ScorecardInterview] The interview being scored.
        @interview = interview
        # @type [Ats::ScorecardInterviewer] The interviewer doing the scoring.
        @interviewer = interviewer
        # @type [DateTime] When the third party's scorecard was created.
        @remote_created_at = remote_created_at
        # @type [DateTime] When the scorecard was submitted.
        @submitted_at = submitted_at
        # @type [Ats::ScorecardOverallRecommendation] The inteviewer's recommendation. 
- `DEFINITELY_NO` - DEFINITELY_NO
- `NO` - NO
- `YES` - YES
- `STRONG_YES` - STRONG_YES
- `NO_DECISION` - NO_DECISION
        @overall_recommendation = overall_recommendation
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
      # Deserialize a JSON object to an instance of Scorecard
      #
      # @param json_object [JSON] 
      # @return [Ats::Scorecard]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct.id
        remote_id = struct.remote_id
        application = struct.application.to_h.to_json()
        application = Ats::ScorecardApplication.from_json(json_object: application)
        interview = struct.interview.to_h.to_json()
        interview = Ats::ScorecardInterview.from_json(json_object: interview)
        interviewer = struct.interviewer.to_h.to_json()
        interviewer = Ats::ScorecardInterviewer.from_json(json_object: interviewer)
        remote_created_at = DateTime.parse(struct.remote_created_at)
        submitted_at = DateTime.parse(struct.submitted_at)
        overall_recommendation = struct.overall_recommendation.to_h.to_json()
        overall_recommendation = Ats::ScorecardOverallRecommendation.from_json(json_object: overall_recommendation)
        remote_was_deleted = struct.remote_was_deleted
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data.map() do | v |
  v = v.to_h.to_json()
  Ats::RemoteData.from_json(json_object: v)
end
        new(id: id, remote_id: remote_id, application: application, interview: interview, interviewer: interviewer, remote_created_at: remote_created_at, submitted_at: submitted_at, overall_recommendation: overall_recommendation, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end
      # Serialize an instance of Scorecard to a JSON object
      #
      # @return [JSON]
      def to_json
        { "id": @id, "remote_id": @remote_id, "application": @application, "interview": @interview, "interviewer": @interviewer, "remote_created_at": @remote_created_at, "submitted_at": @submitted_at, "overall_recommendation": @overall_recommendation, "remote_was_deleted": @remote_was_deleted, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.application.nil?() || Ats::ScorecardApplication.validate_raw(obj: obj.application)
        obj.interview.nil?() || Ats::ScorecardInterview.validate_raw(obj: obj.interview)
        obj.interviewer.nil?() || Ats::ScorecardInterviewer.validate_raw(obj: obj.interviewer)
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.submitted_at&.is_a?(DateTime) != false || raise("Passed value for field obj.submitted_at is not the expected type, validation failed.")
        obj.overall_recommendation.nil?() || Ats::ScorecardOverallRecommendation.validate_raw(obj: obj.overall_recommendation)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end