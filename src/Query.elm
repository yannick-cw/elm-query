module Query exposing (get, parse)

import Dict exposing (Dict)
import Http


type Query
    = Query (Dict String String)


parse : String -> Query
parse queryString =
    queryString
        |> String.dropLeft 1
        |> String.split "&"
        |> List.filterMap paramToKeyValue
        |> Dict.fromList
        |> Query


paramToKeyValue : String -> Maybe ( String, String )
paramToKeyValue params =
    case String.split "=" params of
        [ key, value ] ->
            Maybe.map2 (,) (Http.decodeUri key) (Http.decodeUri value)

        _ ->
            Nothing


get : String -> Query -> Maybe String
get key (Query queryDict) =
    Dict.get key queryDict
