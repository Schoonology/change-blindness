var http = require('http')

http.createServer(function (req, res) {
  res.end('Hello!\n')
})
  .listen(8080)
