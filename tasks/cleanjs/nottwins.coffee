walk = require "fs-walk"

module.exports = (grunt) ->

    noop = () ->

    grunt.task.registerTask "cleanNotTwins", "clean all .js files without .coffee twins", () ->

        walk.walkSync __dirname + '/../../app/js', (basedir, filename, stat) ->

            fileArr = filename.split(".")

            if (grunt.file.isFile basedir + "/" + filename) and (fileArr[1] == "js") and !basedir.match("/js/lib")
                file = basedir.replace("/app/js", "/app/coffee") + "/" + fileArr[0]
                if grunt.file.isFile(file + ".coffee")
                    noop()
                else
                    grunt.file.delete basedir + "/" + fileArr[0] + ".js"

        grunt.log.writeln "OK"