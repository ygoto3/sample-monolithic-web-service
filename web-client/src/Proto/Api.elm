{- !!! DO NOT EDIT THIS FILE MANUALLY !!! -}

module Proto.Api exposing (..)

{-| 
This file was automatically generated by
- [`protoc-gen-elm`](https://www.npmjs.com/package/protoc-gen-elm) 2.3.3
- `protoc` 3.21.12
- the following specification file: `api.proto`

To run it, add a dependency via `elm install` on [`elm-protocol-buffers`](https://package.elm-lang.org/packages/eriktim/elm-protocol-buffers/1.1.0) version latest or higher.


-}

import Maybe
import Protobuf.Decode
import Protobuf.Encode


{-| Default for DestroyItemResponse. Should only be used for 'required' decoders as an initial value.


-}
defaultDestroyItemResponse : DestroyItemResponse
defaultDestroyItemResponse =
    { item = Nothing }


{-| Decode a `DestroyItemResponse` from Bytes


-}
decodeDestroyItemResponse : Protobuf.Decode.Decoder DestroyItemResponse
decodeDestroyItemResponse =
    Protobuf.Decode.message
        defaultDestroyItemResponse
        [ Protobuf.Decode.optional 1 (Protobuf.Decode.map Just decodeItem) (\a r -> { r | item = a }) ]


{-| Encode a `DestroyItemResponse` to Bytes


-}
encodeDestroyItemResponse : DestroyItemResponse -> Protobuf.Encode.Encoder
encodeDestroyItemResponse value =
    Protobuf.Encode.message [ ( 1, (Maybe.map encodeItem >> Maybe.withDefault Protobuf.Encode.none) value.item ) ]


{-| `DestroyItemResponse` message


-}
type alias DestroyItemResponse =
    { item : Maybe Item }


{-| Default for DestroyItemRequest. Should only be used for 'required' decoders as an initial value.


-}
defaultDestroyItemRequest : DestroyItemRequest
defaultDestroyItemRequest =
    {}


{-| Decode a `DestroyItemRequest` from Bytes


-}
decodeDestroyItemRequest : Protobuf.Decode.Decoder DestroyItemRequest
decodeDestroyItemRequest =
    Protobuf.Decode.message defaultDestroyItemRequest []


{-| Encode a `DestroyItemRequest` to Bytes


-}
encodeDestroyItemRequest : DestroyItemRequest -> Protobuf.Encode.Encoder
encodeDestroyItemRequest _ =
    Protobuf.Encode.message []


{-| `DestroyItemRequest` message


-}
type alias DestroyItemRequest =
    {}


{-| Default for CreateItemResponse. Should only be used for 'required' decoders as an initial value.


-}
defaultCreateItemResponse : CreateItemResponse
defaultCreateItemResponse =
    { item = Nothing }


{-| Decode a `CreateItemResponse` from Bytes


-}
decodeCreateItemResponse : Protobuf.Decode.Decoder CreateItemResponse
decodeCreateItemResponse =
    Protobuf.Decode.message
        defaultCreateItemResponse
        [ Protobuf.Decode.optional 1 (Protobuf.Decode.map Just decodeItem) (\a r -> { r | item = a }) ]


{-| Encode a `CreateItemResponse` to Bytes


-}
encodeCreateItemResponse : CreateItemResponse -> Protobuf.Encode.Encoder
encodeCreateItemResponse value =
    Protobuf.Encode.message [ ( 1, (Maybe.map encodeItem >> Maybe.withDefault Protobuf.Encode.none) value.item ) ]


{-| `CreateItemResponse` message


-}
type alias CreateItemResponse =
    { item : Maybe Item }


{-| Default for CreateItemRequest. Should only be used for 'required' decoders as an initial value.


-}
defaultCreateItemRequest : CreateItemRequest
defaultCreateItemRequest =
    { name = "" }


{-| Decode a `CreateItemRequest` from Bytes


-}
decodeCreateItemRequest : Protobuf.Decode.Decoder CreateItemRequest
decodeCreateItemRequest =
    Protobuf.Decode.message
        defaultCreateItemRequest
        [ Protobuf.Decode.optional 1 Protobuf.Decode.string (\a r -> { r | name = a }) ]


{-| Encode a `CreateItemRequest` to Bytes


-}
encodeCreateItemRequest : CreateItemRequest -> Protobuf.Encode.Encoder
encodeCreateItemRequest value =
    Protobuf.Encode.message [ ( 1, Protobuf.Encode.string value.name ) ]


{-| `CreateItemRequest` message


-}
type alias CreateItemRequest =
    { name : String }


{-| Default for IndexItemsResponse. Should only be used for 'required' decoders as an initial value.


-}
defaultIndexItemsResponse : IndexItemsResponse
defaultIndexItemsResponse =
    { item = [] }


{-| Decode a `IndexItemsResponse` from Bytes


-}
decodeIndexItemsResponse : Protobuf.Decode.Decoder IndexItemsResponse
decodeIndexItemsResponse =
    Protobuf.Decode.message
        defaultIndexItemsResponse
        [ Protobuf.Decode.repeated 1 decodeItem .item (\a r -> { r | item = a }) ]


{-| Encode a `IndexItemsResponse` to Bytes


-}
encodeIndexItemsResponse : IndexItemsResponse -> Protobuf.Encode.Encoder
encodeIndexItemsResponse value =
    Protobuf.Encode.message [ ( 1, Protobuf.Encode.list encodeItem value.item ) ]


{-| `IndexItemsResponse` message


-}
type alias IndexItemsResponse =
    { item : List Item }


{-| Default for IndexItemsRequest. Should only be used for 'required' decoders as an initial value.


-}
defaultIndexItemsRequest : IndexItemsRequest
defaultIndexItemsRequest =
    {}


{-| Decode a `IndexItemsRequest` from Bytes


-}
decodeIndexItemsRequest : Protobuf.Decode.Decoder IndexItemsRequest
decodeIndexItemsRequest =
    Protobuf.Decode.message defaultIndexItemsRequest []


{-| Encode a `IndexItemsRequest` to Bytes


-}
encodeIndexItemsRequest : IndexItemsRequest -> Protobuf.Encode.Encoder
encodeIndexItemsRequest _ =
    Protobuf.Encode.message []


{-| `IndexItemsRequest` message


-}
type alias IndexItemsRequest =
    {}


{-| Default for Item. Should only be used for 'required' decoders as an initial value.


-}
defaultItem : Item
defaultItem =
    { id = 0, name = "" }


{-| Decode a `Item` from Bytes


-}
decodeItem : Protobuf.Decode.Decoder Item
decodeItem =
    Protobuf.Decode.message
        defaultItem
        [ Protobuf.Decode.optional 1 Protobuf.Decode.int32 (\a r -> { r | id = a })
        , Protobuf.Decode.optional 2 Protobuf.Decode.string (\a r -> { r | name = a })
        ]


{-| Encode a `Item` to Bytes


-}
encodeItem : Item -> Protobuf.Encode.Encoder
encodeItem value =
    Protobuf.Encode.message [ ( 1, Protobuf.Encode.int32 value.id ), ( 2, Protobuf.Encode.string value.name ) ]


{-| `Item` message


-}
type alias Item =
    { id : Int, name : String }
