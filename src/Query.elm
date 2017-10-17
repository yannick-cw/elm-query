module Query exposing (parse, get)


type alias Query =
    String


parse : String -> Query
parse queryString =
    ""


get : String -> Query -> Maybe String
get key query =
    Just "value"
