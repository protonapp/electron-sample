ApplicationWindow = require './application-window'
app = require('app')

module.exports =
class Application
  win: null

  constructor: (options) ->
    global.application = this

    # Report crashes to our server.
    require('crash-reporter').start()

    # Quit when all windows are closed.
    app.on 'window-all-closed', -> app.quit()
    app.on 'ready', => @openWindow()

  openWindow: ->
    htmlURL = "file://#{__dirname}/../main-window/index.html"
    @win = new ApplicationWindow htmlURL,
      width: 1200,
      height: 800
