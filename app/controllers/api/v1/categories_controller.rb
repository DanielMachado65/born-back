# frozen_string_literal: true

# main controller
class Api::V1::CategoriesController < Api::V1::ApiController
  before_action :set_category, only: %I[show update destroy]

  def index
    @categories = Category.all
    @categories = apply_filters(@categories, :by_name)
    render json: @categories
  end

  def show
    @category.nil? ? api_not_found('ocorreu algum erro') : api_success(@category)
  end

  def create
    category = Api::V1::CategoryService.create(params)
    return api_bad_request(category[:error]) if category[:code] == 400

    api_created(category)
  end

  def update
    return api_error('não foi encontrado a categoria') if @category.nil?

    category = Api::V1::CategoryService.update(@category, params)
    return api_bad_request(category[:error]) if category[:code] == 400

    api_success(category)
  end

  def destroy
    @category.nil? ? api_error('não pode ser excluido') : api_success(@category.destroy)
  end

  private

  def set_category
    @category = Api::V1::CategoryService.find(params)
  end
end
