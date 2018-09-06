url = window.location.origin

apiLinkCode = document.getElementById "api-link-code"
linkCode    = document.getElementById "link-code"
apiCode     = document.getElementById "api-code"

apiLinkCode.innerText = url + "/api-link"
linkCode.innerText    = url + "/images/1.png"
apiCode.innerText     = url + "/api"
