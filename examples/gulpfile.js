'use strict';

var gulp = require('gulp');
var gulpDi = require('gulp-di')(gulp, {
   pattern: ['gulp-​*', 'gulk.*​', 'del', 'browser-sync'],
   rename: {
       'del': 'clean',
       'gulp-autoprefixer': 'prefixer',
   }
})
.provide({
   paths: {
       sass: {
           main: 'scss/main.scss',
           watch: ['scss/main.scss', 'scss/**/*.scss'],
           dest: 'static/css'
       },
       templates: {
           watch: ['templates/**/*', '**/templates/**/*']
       },
       js: {
           watch: 'static/js/**/*.js'
       }
   },
   bsName: 'bs'
})
.tasks('./gulp')
.resolve();
