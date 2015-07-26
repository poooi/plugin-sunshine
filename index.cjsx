remote = require 'remote'
windowManager = remote.require './lib/window'

window.sunshineWindow = null
initialSunshineWindow = ->
  window.sunshineWindow = windowManager.createWindow
    x: config.get 'poi.window.x', 0
    y: config.get 'poi.window.y', 0
    width: 820
    height: 650
  window.sunshineWindow.loadUrl "file://#{__dirname}/index.html"
  if process.env.DEBUG?
    window.sunshineWindow.openDevTools
      detach: true
initialSunshineWindow()

module.exports =
  name: 'Sunshine'
  priority: 100
  displayName: [<FontAwesome key={0} name='sun-o' />, ' 花式晒人']
  description: '晒人用插件'
  author: 'W.G.'
  link: 'https://github.com/JenningsWu'
  version: '0.0.1'
  handleClick: ->
    window.sunshineWindow.show()