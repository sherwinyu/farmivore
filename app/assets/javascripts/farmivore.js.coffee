#= require_self
#= require ./store
#= require ./utils/utils
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./components
#= require_tree ./templates
#= require_tree ./routes
#= require ./router

window.Farmivore = Ember.Application.create()
# Convenience alias.
@Fv = Farmivore
