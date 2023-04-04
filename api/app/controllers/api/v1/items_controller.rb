require 'protos/api_pb'

class Api::V1::ItemsController < ApplicationController

  before_action :set_item, only: %i[ destroy ]

  # GET /items
  def index
    items = Item.all
    response = Protos::IndexItemsResponse.new
    items.each do |i|
      item_proto = Protos::Item.new(
        id: i.id,
        name: i.name
      )
      response.item.push(item_proto)
    end

    response_encoded_data = Protos::IndexItemsResponse.encode(response)

    render plain: response_encoded_data
  end

  # POST /items
  def create
    decoded_data = Protos::CreateItemRequest.decode(request.raw_post)
    p decoded_data
    item = Item.new(
      name: decoded_data.name
    )
    if item.save
      response_item = Protos::Item.new(
        id: item.id,
        name: item.name
      )
      response = Protos::CreateItemResponse.new(item: response_item)
      response_encoded_data = Protos::CreateItemResponse.encode(response)
      render plain: response_encoded_data
    else
      render status: :bad_request
    end
  end

  # DELETE /items/1
  def destroy
    response_item = Protos::Item.new(
      id: @item.id,
      name: @item.name
    )
    response = Protos::DestroyItemResponse.new(item: response_item)

    if @item.destroy
      response_encoded_data = Protos::DestroyItemResponse.encode(response)
      render plain: response_encoded_data
    else
      render status: :bad_request
    end
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

end