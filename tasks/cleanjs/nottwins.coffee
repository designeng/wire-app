walk = require "fs-walk"

module.exports = (grunt) ->

    grunt.task.registerTask "cleanNotTwins", "clean all .js files without .coffee twins", () ->

        walk.walkSync __dirname + '/../../app/js', (basedir, filename, stat) ->

            fileArr = filename.split(".")

            if (grunt.file.isFile basedir + "/" + filename) and (fileArr[1] == "js") and !basedir.match("/js/lib")
                file = basedir.replace("/app/js/", "/app/coffee/") + "/" + fileArr[0] + ".coffee"
                if grunt.file.isFile(file)
                    console.log "ex:::", fileArr[0] + ".coffee"
                else
                    console.log "NOT ex:::", file

                    grunt.file.delete file

                    # console.log basedir.replace("/app/js/", "/app/coffee/"), fileArr[0]


        grunt.log.writeln "OK"