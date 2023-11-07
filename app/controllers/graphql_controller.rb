# frozen_string_literal: true

class GraphqlController < ApplicationController
  def execute
    chain = prepare_handlers_chain
    context = prepare_context
    result = chain.call(handler_context: context)
    validate_result!(result: result)
    render json: result
  rescue StandardError => e
    handle_error(e)
  end

  private

  def prepare_handlers_chain
    ::Graphql::PrepareVariableHandler.new(
      ::Graphql::ExecuteQueryHandler.new
    )
  end

  def prepare_context
    { params: params, session: session }
  end

  def validate_result!(result:)
    raise StandardError, result['errors'] if result['errors'].present?
  end

  def handle_error(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")
    Rollbar.error(e)

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end
end
