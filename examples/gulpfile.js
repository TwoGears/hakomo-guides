/**
 * Example gulpfile with tasks for concatenating
 * and minifying js scripts and autoprefixing css
 */

'use strict';

// Gulp Modules
var gulp = require('gulp');
var uglify = require('gulp-uglify');
var autoprefixer = require('gulp-autoprefixer');
var gutil = require('gulp-util');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var filesize = require('gulp-filesize');
var plumber = require('gulp-plumber');

var PATHS = {
    // JS
    jsRoot: 'js',
    buildJs: 'build/js',

    jsVendor: 'js/vendor',
    buildJsVendor: 'build/js/vendor',

    jsBooking: 'js/booking',
    jsSchedule: 'js/schedule',

    // CSS
    cssRoot: 'css',
    buildCss: 'build/css'
};

// Gulp task for concatenating and minifying all vendor
// scripts (libraries) into one script.
// By specifying them explicitly, the order in which they're
// concatenated is kept
// If the path were -vendor-/*.js, the order is random
gulp.task('vendor', function() {
    return gulp.src([
            PATHS.jsVendor + '/jquery-1.11.1.min.js',
            PATHS.jsVendor + '/jquery-ui.min.js',
            PATHS.jsVendor + '/bootstrap.min.js',
            PATHS.jsVendor + '/slick.min.js',
        ])
        .pipe(filesize())
        .pipe(concat('vendor.min.js'))
        .pipe(filesize())
        .pipe(uglify())
        .pipe(filesize())
        .pipe(gulp.dest(PATHS.buildJsVendor))
        .on('error', gutil.log);
});

// Prevent watch from stopping on error
var onError = function(err) {
    gutil.beep();
    console.log(err);
};

// Gulp task for minifying individual javascript files
gulp.task('uglify', function() {
    return gulp.src(PATHS.jsRoot + '/*.js')
        .pipe(plumber({
            errorHandler: onError
        }))
        .pipe(filesize())
        .pipe(uglify())
        .pipe(filesize())
        .on('error', gutil.log)
        .pipe(gulp.dest(PATHS.buildJs));
});

// Gulp task for autoprefixing main.css after
// the LESS files are compiled
gulp.task('autoprefixer', function() {
    return gulp.src(PATHS.cssRoot + '/main.css')
        .pipe(autoprefixer())
        .pipe(gulp.dest(PATHS.buildCss));
});

// Gulp task for minifying and concatenating
// all booking JS files into one, then moving the result
// in `build/js`
gulp.task('booking', function() {
    return gulp.src([
            PATHS.jsRoot + '/data-attr.js',
            PATHS.jsBooking + '/decline-booking.js',
            PATHS.jsBooking + '/booking-table.js',
            PATHS.jsBooking + '/booking-fields.js',
            PATHS.jsBooking + '/booking-reservation.js',
            PATHS.jsBooking + '/booking-core.js'
        ])
        .pipe(plumber({
            errorHandler: onError
        }))
        .pipe(filesize())
        .pipe(concat('booking.js'))
        .pipe(filesize())
        .pipe(uglify())
        .pipe(filesize())
        .pipe(gulp.dest(PATHS.buildJs))
        .on('error', gutil.log);
});

// Watch for changes in files and rerun tasks
gulp.task('watch', function() {
    gulp.watch(PATHS.jsRoot + '/*.js', ['uglify']);
    gulp.watch(PATHS.jsVendor + '/*.js', ['vendor']);
    gulp.watch(PATHS.jsBooking + '/*.js', ['booking']);
    gulp.watch(PATHS.cssRoot + '/main.css', ['autoprefixer']);
});

// Default task (called when gulp is run through CLI `$ gulp`)
gulp.task('default', [
    'vendor',
    'uglify',
    'booking',
    'autoprefixer',
    'watch',
]);
