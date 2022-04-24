# frozen_string_literal: true

class ServiceResult
    def initialize
      @value = yield if block_given?
      @error = nil
      @error_message = nil
    rescue ArgumentError => arg_error
      @error = arg_error
      @error_message = arg_error.message
    rescue StandardError => se
      @error = se
      @error_message = se.message
    end
  
    def ok?
      @error.blank?
    end
  
    attr_reader :error, :error_message, :value
  end