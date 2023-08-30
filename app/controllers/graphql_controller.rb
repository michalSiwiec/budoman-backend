# frozen_string_literal: true

class GraphqlController < ApplicationController
  def execute
    chain = prepare_handlers_chain
    context = prepare_context
    result = chain.call(handler_context: context)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development(e)
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

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")
    Rollbar.error(e)

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end
end
