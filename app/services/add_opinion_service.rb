class AddOpinionService < BaseService
  def initialize(params:)
    super()
    @params = params
  end

  def call
    create_opinion
  end

  private

  def create_opinion
    Opinion.create!(content: @params[:content],
                    mark: @params[:mark],
                    user_id: @params[:user_id])
  end
end
