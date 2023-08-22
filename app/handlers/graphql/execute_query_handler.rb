module Graphql
  class ExecuteQueryHandler < BaseHandler
    def call(handler_context:)
      execute_query(handler_context: handler_context)
    end

    private

    def execute_query(handler_context:)
      OlxBackendSchema.execute(handler_context[:query],
                               variables: handler_context[:variables],
                               context: handler_context[:context],
                               operation_name: handler_context[:operation_name])
    end
  end
end
