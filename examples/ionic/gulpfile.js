'use strict';

var gulp = require('gulp');
var gutil = require('gulp-util');
var bower = require('bower');
var concat = require('gulp-concat');
var sass = require('gulp-sass');
var prefixer = require('gulp-autoprefixer');
var minifyCss = require('gulp-minify-css');
var rename = require('gulp-rename');
var sh = require('shelljs');
var plumber = require('gulp-plumber');
var uglify = require('gulp-uglify');
var sourcemaps = require('gulp-sourcemaps');
var dev = require('gulp-dev');
var sassdoc = require('sassdoc');
var karma = require('gulp-karma');

var paths = {
  sass: ['./scss/**/*.scss'],
  cssOutput: './www/css',
  js: ['./www/app/components/**/*.js'],
  jsOutput: './www/app',
  root: './www',
  index: './www/index.html',
  karmaConfig: 'karma.conf.js'
};

// Prevent watch from stopping on error
var onError = function (err) {
    gutil.beep();
    console.log(err);
};

gulp.task('default', ['sass', 'watch', 'js']);

/*
  Concat all scripts from components folder
  with sourcemaps
  -> build-scripts.debug.js
  then uglify
  -> build-scripts.js
*/
gulp.task('js', function() {
  gulp.src(paths.js)
    .pipe(plumber({errorHandler: onError}))
    .pipe(sourcemaps.init())
    .pipe(concat('build-scripts.debug.js'))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(paths.jsOutput))
    .pipe(uglify())
    .pipe(rename('build-scripts.js'))
    .pipe(gulp.dest(paths.jsOutput));

});

/*
  Compile sass to css with source maps
  then prefix
  -> ionic.app.css
  then minify
  -> ionic.app.min.css
*/
gulp.task('sass', function(done) {
  gulp.src('./scss/ionic.app.scss')
    .pipe(sass({
      errLogToConsole: true,
      sourceComments: 'map'
    }))
    .pipe(prefixer())
    .pipe(gulp.dest(paths.cssOutput))
    .pipe(minifyCss({
      keepSpecialComments: 0
    }))
    .pipe(rename({ extname: '.min.css' }))
    .pipe(gulp.dest(paths.cssOutput))
    .on('end', done);
});

// Updates the app version number
// Usage:
// $ gulp bump --patch
// $ gulp bump --minor
// $ gulp bump --major
// $ gulp bump --setversion=2.1.0
gulp.task('bump', require('gulp-cordova-bump'));

// Runs tests
gulp.task('test', function(done) {
  return gulp.src(paths.js)
    .pipe(karma({
      configFile: paths.karmaConfig,
      action: 'run'
    }))
    .on('error', function(err) {
      throw err;
    });
});

// Makes sass documentation from comments
gulp.task('sassdoc', function () {
  return gulp.src(paths.sass)
    .pipe(sassdoc());
});

/*
  Run 'gulp dev' in the console to comment out
  the files used in development
  Run 'gulp prod' to comment out the files used for production
 */
gulp.task('dev', function() {
  gulp.src(paths.index)
    .pipe(dev(true))
    .pipe(gulp.dest(paths.root));
});

gulp.task('prod', function() {
  gulp.src(paths.index)
    .pipe(dev(false))
    .pipe(gulp.dest(paths.root));
});


// Watch task
gulp.task('watch', function() {
  gulp.watch(paths.sass, ['sass']);
  gulp.watch(paths.js, ['js']);
});

// Install bower packages
gulp.task('install', ['git-check'], function() {
  return bower.commands.install()
    .on('log', function(data) {
      gutil.log('bower', gutil.colors.cyan(data.id), data.message);
    });
});

// Check if git is installed
gulp.task('git-check', function(done) {
  if (!sh.which('git')) {
    console.log(
      '  ' + gutil.colors.red('Git is not installed.'),
      '\n  Git, the version control system, is required to download Ionic.',
      '\n  Download git here:', gutil.colors.cyan('http://git-scm.com/downloads') + '.',
      '\n  Once git is installed, run \'' + gutil.colors.cyan('gulp install') + '\' again.'
    );
    process.exit(1);
  }
  done();
});
