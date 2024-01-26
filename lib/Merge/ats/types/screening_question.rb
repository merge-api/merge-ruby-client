# frozen_string_literal: true
require_relative "screening_question_job"
require_relative "screening_question_type"
require "date"
require "date"
require "json"

module Merge
  module Ats
    # # The ScreeningQuestion Object 
### Description

The `ScreeningQuestion` object is used to represent questions asked to screen candidates for a job.

### Usage Example

TODO
    class ScreeningQuestion
      attr_reader :id, :remote_id, :job, :description, :title, :type, :required, :options, :created_at, :modified_at, :additional_properties
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param job [Ats::ScreeningQuestionJob] The job associated with the screening question.
      # @param description [String] The description of the screening question
      # @param title [String] The title of the screening question
      # @param type [Ats::ScreeningQuestionType] The data type for the screening question.  - `DATE` - DATE
- `FILE` - FILE
- `SINGLE_SELECT` - SINGLE_SELECT
- `MULTI_SELECT` - MULTI_SELECT
- `SINGLE_LINE_TEXT` - SINGLE_LINE_TEXT
- `MULTI_LINE_TEXT` - MULTI_LINE_TEXT
- `NUMERIC` - NUMERIC
- `BOOLEAN` - BOOLEAN
      # @param required [Boolean] Whether or not the screening question is required.
      # @param options [Array<Object>] 
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::ScreeningQuestion]
      def initialize(id: nil, remote_id: nil, job: nil, description: nil, title: nil, type: nil, required: nil, options: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Ats::ScreeningQuestionJob] The job associated with the screening question.
        @job = job
        # @type [String] The description of the screening question
        @description = description
        # @type [String] The title of the screening question
        @title = title
        # @type [Ats::ScreeningQuestionType] The data type for the screening question. 
- `DATE` - DATE
- `FILE` - FILE
- `SINGLE_SELECT` - SINGLE_SELECT
- `MULTI_SELECT` - MULTI_SELECT
- `SINGLE_LINE_TEXT` - SINGLE_LINE_TEXT
- `MULTI_LINE_TEXT` - MULTI_LINE_TEXT
- `NUMERIC` - NUMERIC
- `BOOLEAN` - BOOLEAN
        @type = type
        # @type [Boolean] Whether or not the screening question is required.
        @required = required
        # @type [Array<Object>] 
        @options = options
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of ScreeningQuestion
      #
      # @param json_object [JSON] 
      # @return [Ats::ScreeningQuestion]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct.id
        remote_id = struct.remote_id
        job = struct.job.to_h.to_json()
        job = Ats::ScreeningQuestionJob.from_json(json_object: job)
        description = struct.description
        title = struct.title
        type = struct.type.to_h.to_json()
        type = Ats::ScreeningQuestionType.from_json(json_object: type)
        required = struct.required
        options = struct.options
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        new(id: id, remote_id: remote_id, job: job, description: description, title: title, type: type, required: required, options: options, created_at: created_at, modified_at: modified_at, additional_properties: struct)
      end
      # Serialize an instance of ScreeningQuestion to a JSON object
      #
      # @return [JSON]
      def to_json
        { "id": @id, "remote_id": @remote_id, "job": @job, "description": @description, "title": @title, "type": @type, "required": @required, "options": @options, "created_at": @created_at, "modified_at": @modified_at }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.job.nil?() || Ats::ScreeningQuestionJob.validate_raw(obj: obj.job)
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.type.nil?() || Ats::ScreeningQuestionType.validate_raw(obj: obj.type)
        obj.required&.is_a?(Boolean) != false || raise("Passed value for field obj.required is not the expected type, validation failed.")
        obj.options&.is_a?(Array) != false || raise("Passed value for field obj.options is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end