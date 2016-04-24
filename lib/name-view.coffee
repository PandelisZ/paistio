{SelectListView} = require 'atom-space-pen-views'
gists = require 'public-gists'


module.exports =
class MySelectListView extends SelectListView
 menu: () ->
   @editor = atom.workspace.getActiveTextEditor()
   @addClass('overlay from-top')
   @panel ?= atom.workspace.addModalPanel(item: this)
   @panel.show()
   @focusFilterEditor()

 viewForItem: (item) ->
   "Please enter a name for your snippet"

 confirmed: () ->
   @panel.hide()
   @getFilterQuery()

 cancelled: ->
   console.log("This view was cancelled")
