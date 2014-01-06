# Gruntfile for sitecontent

module.exports = (grunt) ->
    # variables to use in config
    # foo = 'bar'
    app_dir = 'haberdashery/'
    
    # config
    grunt.initConfig
        coffee:
            compile:
                options:
                    bare: false
                expand: true
                src: ['apps/**/*.coffee']
                dest: app_dir
                ext: '.js'
                
        compass:
            compile:
                config: 'config.rb'
        watch:
            coffee:
                files: ['**/*.coffee']
                tasks: ['coffee']
            compass:
                files: ['sass/**/*.scss']
                tasks: ['compass']
        clean:
            js:
                src: ['haberdashery/apps/**/*.js']
            emacs:
                src: ['**/*~']
                
    # load grunt-* tasks
    require('matchdep').filterDev('grunt-*').forEach grunt.loadNpmTasks
    
    grunt.registerTask 'default', [
        'coffee:compile'
        'compass:compile'
        ]
                          
        