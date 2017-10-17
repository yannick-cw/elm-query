module Query exposing (get, parse)

import Http
import Dict exposing (Dict)


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
            Http.decodeUri value
                |> Maybe.map (\value -> ( key, value ))

        _ ->
            Nothing


get : String -> Query -> Maybe String
get key (Query queryDict) =
    Dict.get key queryDict
