# Import file "medium"
sketch = Framer.Importer.load("imported/medium@1x")

backgroundA = new BackgroundLayer
	backgroundColor: "rgba(255,255,255,1)"

page = new PageComponent
	y: sketch.navBar.height
	width: Screen.width
	height: Screen.height - sketch.navBar.height
	scrollVertical: false
	directionLock: true

for index in [0...3]
	scroll = new ScrollComponent
		size: page.size
		scrollHorizontal: false
		directionLock: true
		contentInset:
			bottom: 100

	sketch["scroll#{index + 1}"].superLayer = scroll.content
	page.addPage(scroll)

sketch.navBar.on Events.Click, ->
	page.currentPage.scrollToTop true, curve: "spring(300, 20,0)"
