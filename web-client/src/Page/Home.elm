module Page.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Url exposing (Protocol(..))
import Http
import Protobuf.Decode as Decode
import Protobuf.Encode as Encode

import Proto.Api exposing (..)

-- MODEL

type alias Model =
    { items : List Item
    , input : String
    }

init : Model
init = Model [ ] ""

type Msg
    = ClickGetItems
    | ClickDeleteItem Int
    | Input String
    | Submit
    | GetItems (Result Http.Error IndexItemsResponse)
    | CreateItem (Result Http.Error CreateItemResponse)
    | DeleteItem Int (Result Http.Error DestroyItemResponse)

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        ClickGetItems ->
            let
                expect = Decode.expectBytes GetItems decodeIndexItemsResponse
            in
                ( model
                , Http.get
                    { url = "http://localhost:3000/api/v1/items"
                    , expect = expect
                    }
                )
        Input input ->
            ( { model | input = input }, Cmd.none )
        Submit ->
            let
                createItemRequest = CreateItemRequest model.input
                createItemRequestEncoder = encodeCreateItemRequest createItemRequest
                createItemRequestBytes = Encode.encode createItemRequestEncoder
                body = Http.bytesBody "application/protobuf" createItemRequestBytes
                expect = Decode.expectBytes CreateItem decodeCreateItemResponse
            in
                ( model
                , Http.post
                    { url = "http://localhost:3000/api/v1/items"
                    , body = body
                    , expect = expect
                    }
                )
        ClickDeleteItem id ->
            let
                url = "http://localhost:3000/api/v1/items/" ++ (String.fromInt id)
                expect = Decode.expectBytes (DeleteItem id) decodeDestroyItemResponse
            in
                ( model
                , Http.request
                    { method = "DELETE"
                    , headers = []
                    , url = url
                    , body = Http.emptyBody
                    , expect = expect
                    , timeout = Nothing
                    , tracker = Nothing
                    }
                )
        GetItems (Ok indexLiveEventsResponse) ->
            ( { model | items = indexLiveEventsResponse.item }, Cmd.none )
        GetItems (Err _) -> ( model, Cmd.none )
        CreateItem (Ok createItemResponse) ->
            case createItemResponse.item of
                Just item ->
                    ( { model | items = List.append model.items [ { id = item.id, name = item.name } ] }
                    , Cmd.none )
                Nothing -> ( model, Cmd.none )
        CreateItem (Err _) -> ( model, Cmd.none )
        DeleteItem id (Ok _) ->
            ( { model | items = List.filter (\i -> i.id /= id) model.items } , Cmd.none )
        DeleteItem _ (Err _) -> ( model, Cmd.none )

-- VIEW

view : Model -> Html Msg
view model =
    section []
        [ h3 [] [ text "Items" ]
        , button [ onClick ClickGetItems ] [ text "Get items" ]
        , Html.form [ onSubmit Submit ]
            [ input [ type_ "text", value model.input, onInput Input ] []
            , button [ disabled (String.length model.input < 1) ]
                [ text "Create item" ]
            ]
        , ul []
            [ li [] <| List.map viewItem model.items ]
        ]

viewItem : Item -> Html Msg
viewItem item =
    li []
        [ text item.name
        , button [ onClick (ClickDeleteItem item.id) ] [ text "Delete" ]
        ]
