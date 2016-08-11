/**
 * Example gulpfile with tasks for concatenating
 * and minifying js scripts and autoprefixing css
 */
'use strict';

var gulp = require('gulp');
var gulpDi = require('gulp-di')(gulp, {
    pattern: ['gulp-*', 'gulk.*', 'del', 'browser-sync'],
    rename: {
        'del': 'clean'
    }
})
.provide({
    paths: {
        sass: {
            main: 'scss/main.scss',
            watch: ['FILES_TO_WATCH'],
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

