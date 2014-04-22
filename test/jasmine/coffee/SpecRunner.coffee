# autoconcatenation with require.config - see app/coffee/requireConfig.coffee, Gruntfile

# additional paths
requirejs.s.contexts._.config.paths["jasmine"] = '/test/jasmine/js/lib/jasmine-2.0.0/jasmine'
requirejs.s.contexts._.config.paths["jasmine-html"] = '/test/jasmine/js/lib/jasmine-2.0.0/jasmine-html'
requirejs.s.contexts._.config.paths["boot"] = '/test/jasmine/js/lib/jasmine-2.0.0/boot'

# additional shims
requirejs.s.contexts._.config.shim["jasmine"] = {exports: "jasmine"}
requirejs.s.contexts._.config.shim["jasmine-html"] = {deps: ['jasmine'], exports: 'jasmine'}
requirejs.s.contexts._.config.shim["boot"] = {deps: ['jasmine', 'jasmine-html'], exports: 'jasmine'}

runTests = (specToRun) ->
    require [
        "boot"
        "underscore"
        "/test/jasmine/js/common/beforeEach.js"
    ], (boot, _) ->

        pathToSpec = "/test/jasmine/js/spec/"
        extention = ".js"

        indexSpecs = [
            specToRun
        ]

        specs = _.map indexSpecs, (spec) ->
            return spec = pathToSpec + spec + extention

        require specs, (specs) ->
            window.onload()

