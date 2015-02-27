#Sublime Text Plugins and Settings


###1. JSHINT
1. npm install -g jshint

2. CMD+SHIFT+P, then type 'install' for packages, then JSHINT

3. Save the file (https://github.com/TwoGears/tg-guides/tree/master/sublime-text/jshint.rc) in your projects root folder.

### 2. Gulp
    - #####Requirements:
        - node and npm ([install](http://nodejs.org/))
    - #####Steps:
        - Go into the `static` dir in the project: `$ cd {projectdir}/{project}/static`
        - Install packages: `$ npm install`
        - To start `gulp` just type `$ gulp`
            - That starts the `default` task that launches 4 other tasks:
              `watch`, `vendor`, `uglify` and `autoprefixer`.
            - `watch` watches for changes in all of the other tasks' files.
            - `uglify` minifies all js files in `js` dir (but not in `js/vendor`) and moves them in `build/js` dir
            - `vendor` concatenates all js files in `js/vendor` into `vendor.min.js` and moves it in `build/js` dir
            - `autoprefixer` autoprefixes css properties in the already compiled from less `main.css` and moves it in `build/css`.
            Now there's no need for manual prefixing in less.

            ***

            - To add another library file, copy it into `js/vendor` and in `gulpfile.js` add it after the other libraries (so they are concatenated in order):

            ***

            - To add/edit tasks, please read [gulp documentation](https://github.com/gulpjs/gulp/blob/master/docs/README.md)

            ***

            - (Warning!) Gulp watch stops the stream when it encounters an error (like syntax error in javascript). Use a linter and don't save when there's an error.