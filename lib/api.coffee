
require('js-yaml')
request = require('request')
Factual = require('factual-api')

HOST = "http://10.199.1.227:10002"

authConfig = require(process.env['HOME'] + '/.factual/factual-auth.yaml')
if authConfig
  KEY = authConfig.key
  SECRET = authConfig.secret

factual = new Factual(KEY, SECRET)
factual.setBaseURI(HOST)

module.exports.facets = (select, query, filters, cb) ->
  params = {
    url : HOST + '/t/places-us/facets',
    qs : {
      limit : 2000,
      KEY : KEY
    }
  }
  if select? then params.qs.select = select
  if query? then params.qs.query = query
  if filters? then params.qs.filters = filters
  request(params, (error, response, body) ->
    cb(body)
  )

module.exports.geocode = (lat, long, cb) ->
  params = {
    url : HOST + '/places/geocode',
    qs : {
      geo : "{\"$point\":[" + lat + "," + long + "]}",
      KEY : KEY
    }
  }
  request(params, (error, response, body) ->
    cb(body)
  )


