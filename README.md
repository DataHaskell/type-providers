# Type providers for Haskell: plans and shared interfaces

# Plans

The most pressing needs are currently:
1. Write XML type provider using [`XML Schema`](https://www.w3schools.com/xml/xml_schema.asp) -
[Michal](mailto:mjgajda@gmail.com) is willing to mentor a student.
2. Support more flat types in `Frames` and `json-autotype`.
3. Make SQL type provider.

Long term goals:
* Type provider for Servant types for whole WebAPIs
* Automatic detection of filetype, and parsing it using your favourite Haskell library.

# Shared interfaces

Anthony Cowley of `Frames` and Michal Gajda of `json-autotype` agreed to join the recognition of flat types,
so that it can be shared between `Frames`, `json-autotype` and other `type-providers`.
