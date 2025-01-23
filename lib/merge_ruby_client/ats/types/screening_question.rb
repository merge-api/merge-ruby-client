# frozen_string_literal: true

require "date"
require_relative "screening_question_job"
require_relative "screening_question_type_enum"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The ScreeningQuestion Object
    #  ### Description
    #  The `ScreeningQuestion` object is used to represent questions asked to screen
    #  candidates for a job.
    #  ### Usage Example
    #  TODO
    class ScreeningQuestion
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Ats::ScreeningQuestionJob] The job associated with the screening question.
      attr_reader :job
      # @return [String] The description of the screening question
      attr_reader :description
      # @return [String] The title of the screening question
      attr_reader :title
      # @return [Merge::Ats::ScreeningQuestionTypeEnum] The data type for the screening question.
      #  - `DATE` - DATE
      #  - `FILE` - FILE
      #  - `SINGLE_SELECT` - SINGLE_SELECT
      #  - `MULTI_SELECT` - MULTI_SELECT
      #  - `SINGLE_LINE_TEXT` - SINGLE_LINE_TEXT
      #  - `MULTI_LINE_TEXT` - MULTI_LINE_TEXT
      #  - `NUMERIC` - NUMERIC
      #  - `BOOLEAN` - BOOLEAN
      attr_reader :type
      # @return [Boolean] Whether or not the screening question is required.
      attr_reader :required
      # @return [Array<Object>]
      attr_reader :options
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
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
      # @param job [Merge::Ats::ScreeningQuestionJob] The job associated with the screening question.
      # @param description [String] The description of the screening question
      # @param title [String] The title of the screening question
      # @param type [Merge::Ats::ScreeningQuestionTypeEnum] The data type for the screening question.
      #  - `DATE` - DATE
      #  - `FILE` - FILE
      #  - `SINGLE_SELECT` - SINGLE_SELECT
      #  - `MULTI_SELECT` - MULTI_SELECT
      #  - `SINGLE_LINE_TEXT` - SINGLE_LINE_TEXT
      #  - `MULTI_LINE_TEXT` - MULTI_LINE_TEXT
      #  - `NUMERIC` - NUMERIC
      #  - `BOOLEAN` - BOOLEAN
      # @param required [Boolean] Whether or not the screening question is required.
      # @param options [Array<Object>]
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::ScreeningQuestion]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, job: OMIT, description: OMIT,
                     title: OMIT, type: OMIT, required: OMIT, options: OMIT, remote_was_deleted: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @job = job if job != OMIT
        @description = description if description != OMIT
        @title = title if title != OMIT
        @type = type if type != OMIT
        @required = required if required != OMIT
        @options = options if options != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "job": job,
          "description": description,
          "title": title,
          "type": type,
          "required": required,
          "options": options,
          "remote_was_deleted": remote_was_deleted
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ScreeningQuestion
      #
      # @param json_object [String]
      # @return [Merge::Ats::ScreeningQuestion]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["job"].nil?
          job = nil
        else
          job = parsed_json["job"].to_json
          job = Merge::Ats::ScreeningQuestionJob.from_json(json_object: job)
        end
        description = parsed_json["description"]
        title = parsed_json["title"]
        type = parsed_json["type"]
        required = parsed_json["required"]
        options = parsed_json["options"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          job: job,
          description: description,
          title: title,
          type: type,
          required: required,
          options: options,
          remote_was_deleted: remote_was_deleted,
          additional_properties: struct
        )
      end

      # Serialize an instance of ScreeningQuestion to a JSON object
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
        obj.job.nil? || Merge::Ats::ScreeningQuestionJob.validate_raw(obj: obj.job)
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.type&.is_a?(Merge::Ats::ScreeningQuestionTypeEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.required&.is_a?(Boolean) != false || raise("Passed value for field obj.required is not the expected type, validation failed.")
        obj.options&.is_a?(Array) != false || raise("Passed value for field obj.options is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
      end
    end
  end
end
