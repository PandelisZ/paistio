searchView = require './search-view.coffee'
nameView = require './name-view.coffee'
#snippetNaming = require './snippet-naming.coffee'
{CompositeDisposable} = require 'atom'

module.exports = footsize =
  searchView: null
  #snippetNaming: null
  modalPanel: null
  subscriptions: null
  resultsList: null

  activate: (state) ->
    @editor = atom.workspace.getActiveTextEditor()
    @output = []

    @searchView = new searchView
    #@nameView = new nameView
    #@snippetNaming = new snippetNaming
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace',
      'footsize:snippets': => @snippets(),
      'footsize:selectText': => @selectText()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @searchView.destroy()

  serialize: ->
    searchViewState: @searchView.serialize()

  snippets: ->
    @searchView.menu(@output)

  selectText: ->
    console.log(@editor.getSelectedText())
    @output.push {'id': 'Todo: Make this work', 'item': @editor.getSelectedText()}
    console.log(@output)

  nameSnippet: ->
    @selectText()
