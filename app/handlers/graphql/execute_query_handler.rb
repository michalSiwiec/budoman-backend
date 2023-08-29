module Graphql
  class ExecuteQueryHandler < BaseHandler
    def call(handler_context:)
      execute_query(handler_context: handler_context)
    end

    private

    def execute_query(handler_context:)
      OlxBackendSchema.execute(handler_context.fetch(:query),
                               variables: handler_context.fetch(:variables),
                               context: handler_context.fetch(:context),
                               operation_name: handler_context.fetch(:operation_name))
    end
  end
end
