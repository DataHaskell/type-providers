# [Type providers](https://docs.microsoft.com/en-us/dotnet/fsharp/tutorials/type-providers/) for Haskell

# Plans

The most pressing needs are currently:
1. Write XML type provider using [`XML Schema`](https://www.w3schools.com/xml/xml_schema.asp) -
[Michal](mailto:mjgajda@gmail.com) is willing to mentor a student.
2. Support more flat types in [`Frames`](http://acowley.github.io/Frames/) and [`json-autotype`](https://hackage.haskell.org/package/json-autotype).
3. Make SQL type provider.

Long term goals:
* Type provider for Servant types for whole WebAPIs
* Automatic detection of filetype, and parsing it using your favourite Haskell library.

_You may apply for Google Summer of Code projects._
_We are also looking for other ways of mentoring students to help us with this project._

# Shared interfaces

Anthony Cowley of [`Frames`](http://acowley.github.io/Frames/)  and Michal Gajda of [`json-autotype`](https://hackage.haskell.org/package/json-autotype) agreed to join the recognition of flat types,
so that it can be shared between [`Frames`](http://acowley.github.io/Frames/) , [`json-autotype`]((https://hackage.haskell.org/package/json-autotype)) and other `type-providers`.
