module.exports = (grunt) ->
  "use strict"
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    sass:
      site:
        options:
          compass: true
        files: [{
          expand: true
          cwd:'src/sass/'
          src:['*.sass']
          dest: 'frontend/web/css/'
          ext: '.css'
        }]
      app:
        options:
          compass: true
        files: [{
          expand: true
          cwd:'src/sass/'
          src:['**/*.sass']
          dest: 'frontend/apps'
          ext: '.css'
        }]
    coffee:
      compileJoined:
        options:
          runtime:'window'
        files: [
          'frontend/web/js/feniex.js': ['frontend/web/src/coffee/*.coffee']
        ]
      glob_to_multiple:
        expand: true,
        flatten: false,
        cwd: 'frontend/apps/',
        src: ['**/*.coffee'],
        dest: 'frontend/apps/',
        ext: '.js'
    cssmin:
      # options:
      #   mergeIntoShorthands: false
      #   roundingPrecision: -1
      target:
        files: [
          expand: true,
          cwd: 'css/'
          src: ['*.css', '!*.min.css']
          dest: 'css'
          ext: '.min.css'
        ]
    watch:
      options:
        livereload:7374
      compass_site:
        files: ['frontend/web/src/sass/**/*.sass']
        tasks: ['sass:site']
      coffee_site:
        files: ['frontend/web/src/coffee/*.coffee']
        tasks: ['coffee:compileJoined']
      compass_app:
        files: ['frontend/web/apps/**/*.sass']
        tasks: ['sass:app']
      coffee_app:
        files: ['frontend/web/apps/**/*.coffee']
        tasks: ['coffee:glob_to_multiple']

  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-iced-coffee"

  grunt.registerTask 'default','compass_site','coffee_site', 'coffee_app', 'cssmin', 'watch'
