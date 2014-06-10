var test = require('tape');
var media = require('rtc-media');

test('MediaStream constructor is defined', function(t) {
  t.plan(1);
  t.equal(typeof MediaStream, 'function', 'have MediaStream constructor');
});

test('can capture a media stream', function(t) {
  var handleError = t.ifError.bind(t);
  var localMedia;
  var timer = setTimeout(t.fail.bind(t, 'timed out'), 30000);

  t.plan(3);

  // capture media
  localMedia = media();
  t.pass('invoked rtc-media capture function successfully');

  localMedia.on('error', handleError);

  localMedia.once('capture', function(stream) {
    clearTimeout(timer);
    localMedia.removeListener('error', handleError);

    t.pass('captured stream');
    t.ok(stream instanceof MediaStream, 'stream is valid');
  });
});
