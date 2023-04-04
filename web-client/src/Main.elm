module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url

import Page.Home exposing (Model, Msg)

-- MAIN
main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }

-- MODEL

type alias Model =
    { key : Nav.Key
    , url : Url.Url
    , page : Page
    }

type Page
    = HomePage Page.Home.Model

init : () -> Url.Url -> Nav.Key -> (Model, Cmd Msg)
init _ url key =
    ( Model key url (HomePage Page.Home.init), Cmd.none )

-- MSG
type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | HomeMsg Page.Home.Msg

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        HomeMsg homeMsg ->
            case model.page of
                HomePage topModel ->
                    let
                        ( newTopModel, topCmd ) =
                            Page.Home.update homeMsg topModel
                    in
                    ( { model | page = HomePage newTopModel }
                    , Cmd.map HomeMsg topCmd
                    )
        _ -> (model, Cmd.none)

-- VIEW

view : Model -> Browser.Document Msg
view model =
    { title = "Sample Monolithic Web Service"
    , body =
        [ section [] [ h1 [] [ text "Sample Monolithic Web Service" ] ]
        , case model.page of
            HomePage homeModel ->
                Page.Home.view homeModel
                    |> Html.map HomeMsg
        ]
    }

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
