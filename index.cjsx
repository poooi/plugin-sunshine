remote = require 'remote'
windowManager = remote.require './lib/window'
path = require 'path-extra'

# i18n configure
i18n = new (require 'i18n-2')
  locales: ['en-US', 'ja-JP', 'zh-CN', 'zh-TW'],
  defaultLocale: 'zh-CN',
  directory: path.join(__dirname, 'asset', 'i18n'),
  updateFiles: false,
  indent: '\t',
  extension: '.json',
  devMode: false
i18n.setLocale(window.language)
__ = i18n.__.bind(i18n)

window.sunshineWindow = null
initialSunshineWindow = ->
  window.sunshineWindow = windowManager.createWindow
    x: config.get 'poi.window.x', 0
    y: config.get 'poi.window.y', 0
    width: 820
    height: 650
    realClose: true
  window.sunshineWindow.loadUrl "file://#{__dirname}/index.html"
  # if process.env.DEBUG?
  #   window.sunshineWindow.openDevTools
  #     detach: true

# if config.get('plugin.Sunshine.enable', true)
#   initialSunshineWindow()

module.exports =
  name: 'Sunshine'
  priority: 100
  displayName: [<FontAwesome key={0} name='sun-o' />, ' 花式晒人']
  description: '晒人用插件'
  author: 'Jennings Wu.'
  link: 'https://github.com/JenningsWu'
  version: '0.0.1'
  handleClick: ->
    # window.sunshineWindow.show()
    initialSunshineWindow()
    window.sunshineWindow.openDevTools
      detach: true
    window.sunshineWindow.show()
