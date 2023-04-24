%dw 2.0
output application/json
var globalList = payload flatMap ((item) -> (
item.books map (b) -> {id: item.id,(b)}))
distinctBy ((item) -> item.bookid)
groupBy ((item) -> item.id)
---
keysOf(globalList) map ((item) ->
{
id: item,
books: globalList[item] map ((book) -> book - 'id')
} )