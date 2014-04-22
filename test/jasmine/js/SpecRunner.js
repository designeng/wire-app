var runTests;

requirejs.s.contexts._.config.paths["jasmine"] = '/test/jasmine/js/lib/jasmine-2.0.0/jasmine';

requirejs.s.contexts._.config.paths["jasmine-html"] = '/test/jasmine/js/lib/jasmine-2.0.0/jasmine-html';

requirejs.s.contexts._.config.paths["boot"] = '/test/jasmine/js/lib/jasmine-2.0.0/boot';

requirejs.s.contexts._.config.shim["jasmine"] = {
  exports: "jasmine"
};

requirejs.s.contexts._.config.shim["jasmine-html"] = {
  deps: ['jasmine'],
  exports: 'jasmine'
};

requirejs.s.contexts._.config.shim["boot"] = {
  deps: ['jasmine', 'jasmine-html'],
  exports: 'jasmine'
};

runTests = function(specToRun) {
  return require(["boot", "underscore", "/test/jasmine/js/common/beforeEach.js"], function(boot, _) {
    var extention, indexSpecs, pathToSpec, specs;
    pathToSpec = "/test/jasmine/js/spec/";
    extention = ".js";
    indexSpecs = [specToRun];
    specs = _.map(indexSpecs, function(spec) {
      return spec = pathToSpec + spec + extention;
    });
    return require(specs, function(specs) {
      return window.onload();
    });
  });
};
