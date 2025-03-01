module Counter exposing (main)

import Browser
import Html exposing (Html, button, div, h1, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


-- モデル

type alias Model =
    { count : Int
    }


init : Model
init =
    { count = 0
    }


-- メッセージ

type Msg
    = Increment
    | Decrement
    | Reset


-- 更新

update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }

        Decrement ->
            { model | count = model.count - 1 }

        Reset ->
            { model | count = 0 }


-- ビュー

view : Model -> Html Msg
view model =
    div
        [ style "display" "flex"
        , style "flex-direction" "column"
        , style "align-items" "center"
        , style "justify-content" "center"
        , style "height" "100vh"
        , style "font-family" "sans-serif"
        ]
        [ h1 [] [ text "カウンター" ]
        , div
            [ style "font-size" "48px"
            , style "margin" "20px"
            ]
            [ text (String.fromInt model.count) ]
        , div
            [ style "display" "flex"
            , style "gap" "10px"
            ]
            [ button
                [ onClick Decrement
                , style "padding" "8px 16px"
                ]
                [ text "-" ]
            , button
                [ onClick Reset
                , style "padding" "8px 16px"
                ]
                [ text "リセット" ]
            , button
                [ onClick Increment
                , style "padding" "8px 16px"
                ]
                [ text "+" ]
            ]
        ]


-- メイン

main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }