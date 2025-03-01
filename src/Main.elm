module Main exposing (main)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (style)


main : Html msg
main =
    div
        [ style "display" "flex"
        , style "justify-content" "center"
        , style "align-items" "center"
        , style "height" "100vh"
        , style "font-family" "sans-serif"
        ]
        [ h1
            [ style "color" "green"
            , style "font-size" "48px"
            ]
            [ text "Hello, World!" ]
        ]