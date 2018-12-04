var assert = require('assert');
require('dotenv').config();

it('read env variables', function(){
    assert.equal(process.env.TESTENV, 'testenv value');
});

/*
describe('next test', function() {
  describe('test1', function() {
    it('test env', function() {
      assert.equal(true, true);
    });
  });
});
*/