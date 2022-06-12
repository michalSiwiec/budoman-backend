# frozen_string_literal: true

module Graphql
  class AddOpinionHandler < BaseHandler
    def initialize(params)
      @params = params
    end

    def handle
      Opinion.create!(content: params[:content],
                      mark: params[:mark],
                      user_id: user_id)
    end

    private

    attr_reader :params

    def user_id
      User.find(params[:user_id]).id
    end
  end
end
