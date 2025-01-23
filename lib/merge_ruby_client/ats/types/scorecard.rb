# frozen_string_literal: true

require "date"
require_relative "scorecard_application"
require_relative "scorecard_interview"
require_relative "scorecard_interviewer"
require_relative "overall_recommendation_enum"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The Scorecard Object
    #  ### Description
    #  The `Scorecard` object is used to represent an interviewer's candidate
    #  recommendation based on a particular interview.
    #  ### Usage Example
    #  Fetch from the `LIST Scorecards` endpoint and filter by `application` to show
    #  all scorecard for an applicant.
    class Scorecard
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Ats::ScorecardApplication] The application being scored.
      attr_reader :application
      # @return [Merge::Ats::ScorecardInterview] The interview being scored.
      attr_reader :interview
      # @return [Merge::Ats::ScorecardInterviewer] The interviewer doing the scoring.
      attr_reader :interviewer
      # @return [DateTime] When the third party's scorecard was created.
      attr_reader :remote_created_at
      # @return [DateTime] When the scorecard was submitted.
      attr_reader :submitted_at
      # @return [Merge::Ats::OverallRecommendationEnum] The inteviewer's recommendation.
      #  - `DEFINITELY_NO` - DEFINITELY_NO
      #  - `NO` - NO
      #  - `YES` - YES
      #  - `STRONG_YES` - STRONG_YES
      #  - `NO_DECISION` - NO_DECISION
      attr_reader :overall_recommendation
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
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
      # @param application [Merge::Ats::ScorecardApplication] The application being scored.
      # @param interview [Merge::Ats::ScorecardInterview] The interview being scored.
      # @param interviewer [Merge::Ats::ScorecardInterviewer] The interviewer doing the scoring.
      # @param remote_created_at [DateTime] When the third party's scorecard was created.
      # @param submitted_at [DateTime] When the scorecard was submitted.
      # @param overall_recommendation [Merge::Ats::OverallRecommendationEnum] The inteviewer's recommendation.
      #  - `DEFINITELY_NO` - DEFINITELY_NO
      #  - `NO` - NO
      #  - `YES` - YES
      #  - `STRONG_YES` - STRONG_YES
      #  - `NO_DECISION` - NO_DECISION
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::Scorecard]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, application: OMIT,
                     interview: OMIT, interviewer: OMIT, remote_created_at: OMIT, submitted_at: OMIT, overall_recommendation: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @application = application if application != OMIT
        @interview = interview if interview != OMIT
        @interviewer = interviewer if interviewer != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @submitted_at = submitted_at if submitted_at != OMIT
        @overall_recommendation = overall_recommendation if overall_recommendation != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "application": application,
          "interview": interview,
          "interviewer": interviewer,
          "remote_created_at": remote_created_at,
          "submitted_at": submitted_at,
          "overall_recommendation": overall_recommendation,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Scorecard
      #
      # @param json_object [String]
      # @return [Merge::Ats::Scorecard]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["application"].nil?
          application = nil
        else
          application = parsed_json["application"].to_json
          application = Merge::Ats::ScorecardApplication.from_json(json_object: application)
        end
        if parsed_json["interview"].nil?
          interview = nil
        else
          interview = parsed_json["interview"].to_json
          interview = Merge::Ats::ScorecardInterview.from_json(json_object: interview)
        end
        if parsed_json["interviewer"].nil?
          interviewer = nil
        else
          interviewer = parsed_json["interviewer"].to_json
          interviewer = Merge::Ats::ScorecardInterviewer.from_json(json_object: interviewer)
        end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        submitted_at = (DateTime.parse(parsed_json["submitted_at"]) unless parsed_json["submitted_at"].nil?)
        overall_recommendation = parsed_json["overall_recommendation"]
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
          application: application,
          interview: interview,
          interviewer: interviewer,
          remote_created_at: remote_created_at,
          submitted_at: submitted_at,
          overall_recommendation: overall_recommendation,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Scorecard to a JSON object
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
        obj.application.nil? || Merge::Ats::ScorecardApplication.validate_raw(obj: obj.application)
        obj.interview.nil? || Merge::Ats::ScorecardInterview.validate_raw(obj: obj.interview)
        obj.interviewer.nil? || Merge::Ats::ScorecardInterviewer.validate_raw(obj: obj.interviewer)
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.submitted_at&.is_a?(DateTime) != false || raise("Passed value for field obj.submitted_at is not the expected type, validation failed.")
        obj.overall_recommendation&.is_a?(Merge::Ats::OverallRecommendationEnum) != false || raise("Passed value for field obj.overall_recommendation is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
