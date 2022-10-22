# frozen_string_literal: true

class AddOpinionHandler < BaseHandler
  def initialize(params)
    @params = params
  end

  def handle
    Opinion.create!(content: @params[:content],
                    mark: @params[:mark],
                    user_id: @params[:user_id])
  end
end
