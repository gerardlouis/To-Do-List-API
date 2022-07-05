class Api::V1::TdListsController < ApplicationController
  
  # index renders all items in the lists table
  def index
    td_lists = TdList.all
    render json: td_lists, status: 200
  end
  
  def create
    td_list = TdList.new(
      name: td_list_params[:name],
      description: td_list_params[:description],
      updated_by: td_list_params[:updated_by]
    )
    if td_list.save
      render json: td_list, status: 200
    else
      render json: { error: "Error creating list." }
    end
  end

  def show
    td_list = TdList.find_by(id: params[:id])
    if td_list
      render json: td_list, status: 200
    else
      render json: { error: "List not found." }
    end
  end

  private
    def td_list_params
      params.require(:td_list).permit([
        :name,
        :description,
        :updated_by
      ])
    end
end
