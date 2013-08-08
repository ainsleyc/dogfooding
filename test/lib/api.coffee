
expect = require('chai').expect
api = require('../../lib/api')
nock = require('nock')
nock.recorder.rec()

describe 'lib/api', ->

  it 'facets', (done) ->
    api.facets("neighborhood", null, null, (result) ->
      expect(JSON.parse(result).response.data.neighborhood).to.exist
      done()
    )

  it 'geocode', (done) ->
    api.geocode(34.06021, -118.41828, (result) ->
      console.log(JSON.parse(result))
      expect(JSON.parse(result).response.data.address).to.exist
      done()
    )
