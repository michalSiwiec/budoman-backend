# frozen_string_literal: true

class GraphqlController < ApplicationController
  def execute
    context = ::Graphql::PrepareContextService.call(params: params, session: session)
    result = ::Graphql::ExecuteQueryService.call(context: context)
    render json: result
  rescue StandardError => e
    handle_error(e)
  end

  private

  def handle_error(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")
    Rollbar.error(e)

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end
end
