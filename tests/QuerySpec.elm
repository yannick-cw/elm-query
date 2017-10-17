module QuerySpec exposing (..)

import Expect
import Query
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
        , test "return Nothing when given query is empty" <|
            \_ ->
                Query.parse ""
                    |> Query.get "foo"
                    |> Expect.equal Nothing
        , test "decode the value" <|
            \_ ->
                Query.parse "?key=a%20value"
                    |> Query.get "key"
                    |> Expect.equal (Just "avalue")
        ]
