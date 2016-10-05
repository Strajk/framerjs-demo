sketch = Framer.Importer.load("imported/medium@1x")

new BackgroundLayer
	backgroundColor: "rgba(255,255,255,1)"

page = new PageComponent
	size: Screen.size
	contentInset:
		top: sketch.navBar.height
	directionLock: true
	scrollVertical: false

for index in [1..3]
	scroll = new ScrollComponent
		size: page.size
		contentInset:
			bottom: 100
		directionLock: true
		scrollHorizontal: false
	scroll.content.addChild sketch["scroll#{index}"]
	page.addPage(scroll)

sketch.navBar.on Events.Click, ->
	page.currentPage.scrollToTop true, curve: "spring(300, 20,0)"
