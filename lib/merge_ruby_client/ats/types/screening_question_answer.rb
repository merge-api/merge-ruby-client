# frozen_string_literal: true

require "date"
require_relative "screening_question_answer_question"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The ScreeningQuestionAnswer Object
    #  ### Description
    #  The `ScreeningQuestionAnswer` object is used to represent candidate responses to
    #  a screening question, for a specific application.
    #  ### Usage Example
    #  TODO
    class ScreeningQuestionAnswer
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Ats::ScreeningQuestionAnswerQuestion] The screening question associated with the candidate’s answer. To determine the
      #  data type of the answer, you can expand on the screening question by adding
      #  `screening_question_answers.question` to the `expand` query parameter.
      attr_reader :question
      # @return [String] The candidate’s response to the screening question.
      attr_reader :answer
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
      # @param question [Merge::Ats::ScreeningQuestionAnswerQuestion] The screening question associated with the candidate’s answer. To determine the
      #  data type of the answer, you can expand on the screening question by adding
      #  `screening_question_answers.question` to the `expand` query parameter.
      # @param answer [String] The candidate’s response to the screening question.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::ScreeningQuestionAnswer]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, question: OMIT, answer: OMIT,
                     remote_was_deleted: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @question = question if question != OMIT
        @answer = answer if answer != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "question": question,
          "answer": answer,
          "remote_was_deleted": remote_was_deleted
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ScreeningQuestionAnswer
      #
      # @param json_object [String]
      # @return [Merge::Ats::ScreeningQuestionAnswer]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["question"].nil?
          question = nil
        else
          question = parsed_json["question"].to_json
          question = Merge::Ats::ScreeningQuestionAnswerQuestion.from_json(json_object: question)
        end
        answer = parsed_json["answer"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          question: question,
          answer: answer,
          remote_was_deleted: remote_was_deleted,
          additional_properties: struct
        )
      end

      # Serialize an instance of ScreeningQuestionAnswer to a JSON object
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
        obj.question.nil? || Merge::Ats::ScreeningQuestionAnswerQuestion.validate_raw(obj: obj.question)
        obj.answer&.is_a?(String) != false || raise("Passed value for field obj.answer is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
      end
    end
  end
end
