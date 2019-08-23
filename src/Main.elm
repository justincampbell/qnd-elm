module Main exposing (Msg(..), main, update, view)

import Browser
import Debug exposing (log)
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Process
import Random
import Time


main =
    Browser.sandbox { init = init, update = update, view = view }


type Msg
    = Roll
    | Rolled Int
    | Reset


init =
    {rolled = False
      , first = 0
      }
    , 
    )


update msg model =
    case msg of
        Reset ->
            ( init, Cmd.none )

        Roll ->
            ( model, Random.generate Rolled roll )

        Rolled n ->
            ( { model | first = n }, Cmd.none )


view model =
    div []
        [ if model.rolled then
            div [] [ text "Rolled" ]

          else
            div []
                [ button
                    [ onClick Roll ]
                    [ text "Roll" ]
                ]
        , button
            [ onClick Reset ]
            [ text "Reset" ]
        ]


roll =
    Random.generate Roll (Random.int 1 6)
