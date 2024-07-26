# frozen_string_literal: true

require_relative "screening_question_answer_request_question"
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
    class ScreeningQuestionAnswerRequest
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [Merge::Ats::ScreeningQuestionAnswerRequestQuestion] The screening question associated with the candidate’s answer. To determine the
      #  data type of the answer, you can expand on the screening question by adding
      #  `screening_question_answers.question` to the `expand` query parameter.
      attr_reader :question
      # @return [String] The candidate’s response to the screening question.
      attr_reader :answer
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param remote_id [String] The third-party API ID of the matching object.
      # @param question [Merge::Ats::ScreeningQuestionAnswerRequestQuestion] The screening question associated with the candidate’s answer. To determine the
      #  data type of the answer, you can expand on the screening question by adding
      #  `screening_question_answers.question` to the `expand` query parameter.
      # @param answer [String] The candidate’s response to the screening question.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::ScreeningQuestionAnswerRequest]
      def initialize(remote_id: OMIT, question: OMIT, answer: OMIT, integration_params: OMIT,
                     linked_account_params: OMIT, additional_properties: nil)
        @remote_id = remote_id if remote_id != OMIT
        @question = question if question != OMIT
        @answer = answer if answer != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "remote_id": remote_id,
          "question": question,
          "answer": answer,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ScreeningQuestionAnswerRequest
      #
      # @param json_object [String]
      # @return [Merge::Ats::ScreeningQuestionAnswerRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_id = parsed_json["remote_id"]
        if parsed_json["question"].nil?
          question = nil
        else
          question = parsed_json["question"].to_json
          question = Merge::Ats::ScreeningQuestionAnswerRequestQuestion.from_json(json_object: question)
        end
        answer = parsed_json["answer"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          remote_id: remote_id,
          question: question,
          answer: answer,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of ScreeningQuestionAnswerRequest to a JSON object
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
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.question.nil? || Merge::Ats::ScreeningQuestionAnswerRequestQuestion.validate_raw(obj: obj.question)
        obj.answer&.is_a?(String) != false || raise("Passed value for field obj.answer is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
