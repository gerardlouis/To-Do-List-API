class Api::V1::TdListItemsController < ApplicationController
  def create
    td_category = TdCategory.find_by(id: params[:td_category_id])

    if td_category
      puts td_list_item_params[:due_date]
      td_list_item = TdListItem.new(
        name: td_list_item_params[:name],
        description: td_list_item_params[:description],
        due_date: td_list_item_params[:due_date]),
        priority: td_list_item_params[:priority],
        updated_by: td_list_item_params[:updated_by],
        td_category_id: td_list_item_params[:td_category_id]
      )
      if td_list_item.save
        render json: td_list_item, status: 200
      else
        render json: { error: "Error creating list item." }
      end
    else
      render json: { error: "Invalid category id" }
    end
  end

  def show
    td_list_item = TdListItem.where(td_category_id: params[:id])
    if td_list_item
      render json: td_list_item, status: 200
    else
      render json: { error: "No list items found for given category id." }
    end
  end

  def destroy
    td_list_item = TdListItem.find_by(id: params[:id])
    if td_list_item
      render json: td_list_item, status: 200
      td_list_item.destroy
    else
      render json: { error: "List item not found."}
    end
  end

  private
    def td_list_item_params
      params.require(:td_list_item).permit([
        :name,
        :description,
        :due_date,
        :priority,
        :updated_by,
        :td_category_id
      ])
    end
end
