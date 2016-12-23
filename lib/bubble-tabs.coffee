CompositeDisposable = require('atom').CompositeDisposable
active = true

module.exports = new class BubbleTabs
	activate : (state)->
		@subscriptions = new CompositeDisposable
		@subscriptions.add atom.commands.add('atom-workspace',{
			'bubble-tabs:toggle' : => @toggle()
		})
		window.addEventListener 'focus', (event)->
			return unless active
			pane = atom.workspace.getActivePane()
			if pane.focused
				setTimeout ->
					pane.moveItem pane.getActiveItem(), 0
				,1
		,true
		return
	deactivate : ->
		@subscriptions.dispose()
		return
	toggle : ->
		active = !active
		return
