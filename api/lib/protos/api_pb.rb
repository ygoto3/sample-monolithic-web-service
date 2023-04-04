# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: api.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("api.proto", :syntax => :proto3) do
    add_message "sample_monolithic_web_service.api.Item" do
      optional :id, :int32, 1
      optional :name, :string, 2
    end
    add_message "sample_monolithic_web_service.api.IndexItemsRequest" do
    end
    add_message "sample_monolithic_web_service.api.IndexItemsResponse" do
      repeated :item, :message, 1, "sample_monolithic_web_service.api.Item"
    end
    add_message "sample_monolithic_web_service.api.CreateItemRequest" do
      optional :name, :string, 1
    end
    add_message "sample_monolithic_web_service.api.CreateItemResponse" do
      optional :item, :message, 1, "sample_monolithic_web_service.api.Item"
    end
    add_message "sample_monolithic_web_service.api.DestroyItemRequest" do
    end
    add_message "sample_monolithic_web_service.api.DestroyItemResponse" do
      optional :item, :message, 1, "sample_monolithic_web_service.api.Item"
    end
  end
end

module Protos
  Item = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("sample_monolithic_web_service.api.Item").msgclass
  IndexItemsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("sample_monolithic_web_service.api.IndexItemsRequest").msgclass
  IndexItemsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("sample_monolithic_web_service.api.IndexItemsResponse").msgclass
  CreateItemRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("sample_monolithic_web_service.api.CreateItemRequest").msgclass
  CreateItemResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("sample_monolithic_web_service.api.CreateItemResponse").msgclass
  DestroyItemRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("sample_monolithic_web_service.api.DestroyItemRequest").msgclass
  DestroyItemResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("sample_monolithic_web_service.api.DestroyItemResponse").msgclass
end