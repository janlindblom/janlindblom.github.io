module.exports = (grunt) ->
  grunt.initConfig
    concat:
      options:
        stripBanners: false
      jquery:
        src: ["_components/jquery-1.11.0/dist/jquery.js"]
        dest: "javascripts/jquery.js"
      modernizr:
        src: ["_components/modernizr/modernizr.js"]
        dest: "javascripts/modernizr.js"
      foundation:
        src: [
          "_components/foundation/js/foundation/foundation.js"
        ]
        dest: "javascripts/foundation.js"
    uglify:
      jquery:
        src: "<%= concat.jquery.dest %>"
        dest: "javascripts/jquery.min.js"
      modernizr:
        src: "<%= concat.modernizr.dest %>"
        dest: "javascripts/modernizr.min.js"
      foundation:
        src: "<%= concat.foundation.dest %>"
        dest: "javascripts/foundation.min.js"
      app:
        src: "javascripts/app.js"
        dest: "javascripts/foundation.min.js"
    watch:
      gruntfile:
        files: "sass/*.sass"
        tasks: ["compass"]
    jekyll:
      options:
        config: '_config.yml'
        bundleExec: true
      dist:
        options:
          drafts: false
    compass:
      dist:
        options:
          config: "config.rb"

  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-jekyll"
  
  grunt.registerTask "default", [
    "compass"
    "concat"
    "uglify"
    "jekyll"
  ]
  
  grunt.registerTask "assets", [
    "compass"
    "concat"
    "uglify"
  ]
  
  return
