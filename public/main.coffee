more   = document.getElementById "more"
images = document.getElementById "images"

requestText = (url, cb) ->
	xhr = new XMLHttpRequest
	xhr.open 'GET', url, true
	xhr.send()
	xhr.onreadystatechange = ->
		return if xhr.readyState isnt 4

		if xhr.status isnt 200
			console.error xhr.status + ': ' + xhr.statusText
		else
			cb xhr.responseText

addImage = ->
	requestText "/api-link", (link) ->
		wrapper = document.createElement "div"
		wrapper.className = "think-image-wrapper"

		image = document.createElement "img"
		image.className = "think-image"
		image.src = link

		wrapper.appendChild image
		images.appendChild wrapper

		image.onload = ->
			images.scroll
				top: 99999999999999999999999999999999999999
				left: 0
				behavior: "smooth"

more.onclick = addImage

addImage()
