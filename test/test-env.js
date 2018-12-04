var assert = require('assert');
require('dotenv').config();

describe('env variables', function() {
    it('read test env', function() {
      assert.equal(true, true);
    });
    it('read env prov', function(){
    assert.equal(process.env.INFURA_ROPSTEN_ENDPOINT, 'https://ropsten.infura.io/v3/ddb4e9625f68463ba2ba99232d3a06c1');
});

  });
