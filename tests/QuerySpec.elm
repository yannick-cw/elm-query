module QuerySpec exposing (..)

import Query
import Expect
import Test exposing (Test, describe, test)


all : Test
all =
    describe "Query"
        [ test "be able to extract a parameter from a query" <|
            \_ ->
                Query.parse "?key=value"
                    |> Query.get "key"
                    |> Expect.equal (Just "value")
        , test "return Nothing when key could not be found" <|
            \_ ->
                Query.parse "?key=value"
                    |> Query.get "foo"
                    |> Expect.equal Nothing
        ]
