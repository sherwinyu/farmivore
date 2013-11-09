#filter function
resetFilters = ->
  $(".sortable").find("tr").show()
  $(".filters").find("dd").removeClass "active"
$(".filters").find("a").click ->
  resetFilters()

  #console.log($(this).data());
  category = $(@).data("category")
  if category
    $(".sortable").find("tr").not(":first").not("[data-category='" + category + "']").hide()
    $(@).closest("dd").addClass "active"
  else
    $(".showall").addClass "active"


#sort function
$(".sortable").find("th").append("<span class='sortarrows'>&uarr;&darr;</div>").hover(->
  $(@).addClass "highlightSearch"
, ->
  $(@).removeClass "highlightSearch"
).each ->
  th = $(@)
  thIndex = th.index()
  inverse = false
  table = th.closest("table")
  th.click ->
    table.find("td").filter(->
      $(@).index() is thIndex
    ).sortElements ((a, b) ->
      (if $.text([a]) > $.text([b]) then (if inverse then -1 else 1) else (if inverse then 1 else -1))
    ), ->

      # parentNode is the element we want to move
      @parentNode

    inverse = not inverse



#search function
$("#search-lastweek").keyup ->
  value = @value.toLowerCase().trim()
  $(".sortable").find("tr").each (index) ->
    return  unless index
    $(this).find("td").each ->
      id = $(this).text().toLowerCase().trim()
      not_found = (id.indexOf(value) is -1)
      $(this).closest("tr").toggle not not_found
      not_found

window.Farmivore =
  test: 5
  addListing: (data) ->




$('.add-button').click (el)->
  $el = $(el.target).closest('tr.listing')
  zug = $el.find("td").map( (i, el) -> $(el).text())
  listing =
    description: zug[1]
    price: zug[2]
    farm: zug[4]
    category:  zug[0]
  $el.clone().appendTo('#shopping-list')




