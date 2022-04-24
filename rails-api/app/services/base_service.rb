# frozen_string_literal: true

class BaseService

  def self.run(*args, &block)
    @instance = nil
    ServiceResult.new {
      @instance = new(*args, &block)
      @instance.run
    }
  end
end