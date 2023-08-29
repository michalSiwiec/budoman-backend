module Graphql
  class PrepareVariableHandler < BaseHandler
    def call(handler_context:)
      context = prepare_context(params: handler_context.fetch(:params), session: handler_context.fetch(:session))
      @next_handler&.call(handler_context: context)
    end

    private

    def prepare_context(params:, session:)
      variables = prepare_variables(variables_param: params.fetch(:variables))
      query = params.fetch(:query)
      operation_name = params.fetch(:operationName, nil)
      context = { session: session, current_user: current_user(session: session) }

      { variables: variables, query: query, operation_name: operation_name, context: context }
    end

    def prepare_variables(variables_param:)
      case variables_param
      when String
        if variables_param.present?
          JSON.parse(variables_param) || {}
        else
          {}
        end
      when Hash
        variables_param
      when ActionController::Parameters
        variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
      when nil
        {}
      else
        raise ArgumentError, "Unexpected parameter: #{variables_param}"
      end
    end

    def current_user(session:)
      ::Users::SessionUserService.new(session: session).current_user
    end
  end
end
