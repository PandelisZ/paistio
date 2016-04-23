{SelectListView} = require 'atom-space-pen-views'
gists = require 'public-gists'


module.exports =
class MySelectListView extends SelectListView
 menu: (itemList) ->
   #super
   @addClass('overlay from-top')
   @setItems(itemList)
   @panel ?= atom.workspace.addModalPanel(item: this)
   @panel.show()
   @focusFilterEditor()

 viewForItem: (item) ->
   "<li>#{item}</li>"

 confirmed: (item) ->
   console.log("#{item} was selected")

 cancelled: ->
   console.log("This view was cancelled")
