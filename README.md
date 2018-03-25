# [Type providers](https://docs.microsoft.com/en-us/dotnet/fsharp/tutorials/type-providers/) for Haskell

[![Join the chat at https://gitter.im/dataHaskell/type-providers](https://badges.gitter.im/dataHaskell/type-providers.svg)](https://gitter.im/dataHaskell/type-providers?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Plans

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

## Shared interfaces

Anthony Cowley of [`Frames`](http://acowley.github.io/Frames/)  and Michal Gajda of [`json-autotype`](https://hackage.haskell.org/package/json-autotype) agreed to join the recognition of flat types,
so that it can be shared between [`Frames`](http://acowley.github.io/Frames/) , [`json-autotype`]((https://hackage.haskell.org/package/json-autotype)) and other `type-providers`.

## XML

XML Schema is published for most popular XML formats. For those that have RelaxNG schema, we can use converter.
So I recommend starting by using [TagSoup](https://github.com/ndmitchell/tagsoup) to parse XML Schema.

It can be done by beginner-to-intermediate level Haskell programmer.
Level of task complexity is similar to [this](https://github.com/mgajda/json-autotype/blob/master/Data/Aeson/AutoType/CodeGen/HaskellFormat.hs). (No advanced type classes needed, just IO, and XML parsing monad.)
No need to bother if code to convert XML Schema to Haskell will be ugly at first - we can use our own tool to generate a new one :-).

References:
* [Lazy version of TagSoup](https://hackage.haskell.org/package/wraxml)
* [XML to SQL conversion](http://wiki.di.uminho.pt/twiki/pub/Education/Archive/XMLtoSQLConversionToolAFPProject/padl04.pdf)
* [Example XML Schemas](https://github.com/gchq/stroom-content/tree/master/source/core-xml-schemas/stroomContent/XML%20Schemas)
* [Office OpenXML are probably one of the largest](https://en.wikipedia.org/wiki/Office_Open_XML_file_formats)
* [XML-ish and XPath-ish XML parsing library](https://wiki.haskell.org/HXT/Practical)
* [UUXML](http://wiki.di.uminho.pt/twiki/pub/Education/Archive/XMLtoSQLConversionToolAFPProject/padl04.pdf)
- there was another effort to provide XML-Haskell data binding
I am contacting authors about their UUXML attempt, but it seems that is defunct as of now (_We contacted the authors - waiting for response_.)

## SQL

Ideally we could use [Selda](https://hackage.haskell.org/package/selda-0.1.12.1/docs/Database-Selda-Generic.html) and generate record types for each table to start with.
We just need a interoperable SQL library that allows to query table types (like ODBC).
