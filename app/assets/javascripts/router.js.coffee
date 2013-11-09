# For more information see: http://emberjs.com/guides/routing/

Farmivore.Router.map ()->
  @resource "place", path: "/place", ->


Farmivore.ApplicationRoute = Ember.Route.extend
  beforeModel: ->
    @transitionTo('place')

  activate: ->
  wag: 5
  model: ->
    @store.find('farm')

Farmivore.PlaceRoute = Ember.Route.extend
  activate: ->
  model: ->
    @store.find('farm').then (farms) =>
      place = @store.createRecord Fv.Place,
        title: "Wooster Square"
      farms.forEach (farm)->
        place.get('farms').pushObject farm
      @store.find(Fv.ListingItem).then (listingItems) ->
        listingItems.forEach (li) =>
          li.get('farm.listingItems').pushObject li
          li.get('farm').notifyPropertyChange('listingItems')
      place





###
window.doit = ->
  window.src2 = src.map( (list) ->
    zug = Fv.__container__.lookup('store:main').find('farm', name: list[0])
    farm_id = zug.get('firstObject.id')
    ret =
      farm_id: farm_id
      # name: list[0]
      # farmerName: list[1]
      description1: list[2]
      description2: list[3]
      category: list[4]
      priceString: list[5]
  )
###

