gulp   = require 'gulp'
gutil  = require 'gulp-util'
uglify = require 'gulp-uglify'
coffee = require 'gulp-coffee'
rename = require 'gulp-rename'
karma  = require 'gulp-karma'
ngmin  = require 'gulp-ngmin'


codeFiles = ['src/*.coffee']
testFiles = [
    'bower_components/angular/angular.js'
    'bower_components/angular-mocks/angular-mocks.js'
    'src/*.coffee'
    'test/*.spec.coffee'
]

gulp.task 'karma', ->

    options =
        configFile: 'karma.conf.js'
        action: 'run'
        
    gulp.src testFiles
        .pipe karma options

gulp.task 'build', ->
    gulp.src codeFiles
        .pipe coffee()
        .pipe ngmin()
        .pipe uglify {mangle: false}
        .pipe rename { ext: '.min.js' }
        .pipe gulp.dest 'dist'