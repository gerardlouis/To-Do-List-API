class Api::V1::TdCategoriesController < ApplicationController
  def create
    td_list = TdList.find_by(id: params[:td_list_id])

    if td_list
      td_category = TdCategory.new(
        name: td_category_params[:name],
        description: td_category_params[:description],
        updated_by: td_category_params[:updated_by],
        td_list_id: td_category_params[:td_list_id]
      )
      if td_category.save
        render json: td_category, status: 200
      else
        render json: { error: "Error creating category." }
      end
    else
      render json: { error: "Invalid list id" }
    end
  end

  def show
    td_category = TdCategory.find_by(td_list_id: params[:id])
    if td_category
      render json: td_category, status: 200
    else
      render json: { error: "No categories found for given list id." }
    end
  end

  def destroy
    td_category = TdCategory.find_by(id: params[:id])
    if td_category
      render json: td_category, status: 200
      td_category.destroy
    else
      render json: { error: "Category not found."}
    end
  end

  private
    def td_category_params
      params.require(:td_category).permit([
        :name,
        :description,
        :updated_by,
        :td_list_id
      ])
    end
end
