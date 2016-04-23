{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'footsize:convert': => @convert()
      'footsize:boostrapCDN': => @boostrapCDN()
      'footsize:html5': => @html5()

  deactivate: ->
    @subscriptions.dispose()

  convert: ->
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText('Hello, world!')

  boostrapCDN: ->
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText('
        <!-- Latest compiled and minified CSS -->\n
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">\n
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
      ')

  html5: ->
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText('
        <!DOCTYPE html>\n
<html lang="en">\n
  <head>\n
    <meta charset="utf-8">\n
    <meta http-equiv="X-UA-Compatible" content="IE=edge">\n
    <meta name="viewport" content="width=device-width, initial-scale=1">\n
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->\n
    <title>Bootstrap 101 Template</title>\n
  </head>\n
  <body>\n
    <h1>Hello, world!</h1>\n
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>\n
    <!-- Include all compiled plugins (below), or include individual files as needed -->\n
    <script src="js/bootstrap.min.js"></script>\n
  </body>\n
</html>
      ')
