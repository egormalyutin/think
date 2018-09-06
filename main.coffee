# TODO: offer

fs   = require "fs"
path = require "path"

express = require "express"
helmet  = require "helmet"

app = express()

# middlewares
app.use helmet()

# static
app.use "/images", express.static path.join __dirname, "images"
app.use "/", express.static path.join __dirname, "public"

# helpers
random = (min, max) ->
	unless max
		max = min
		min = 0

	return min + Math.floor Math.random() * (max - min)

randomArr = (arr) ->
	index = random 0, arr.length
	return arr[index]

images = fs.readdirSync path.join __dirname, "images"

randomImage = -> randomArr images

toImagePath = (name) ->
	path.join __dirname, "images", name

app.get "/api", (req, res) ->
	res.sendFile toImagePath randomImage()

app.get "/api-link", (req, res) ->
	url = req.protocol + '://' + req.get('host')
	res.send url + "/images/" + randomImage()

PORT = process.env.PORT or 8080

app.listen PORT, ->
	console.log "Listening on http://localhost:" + PORT
