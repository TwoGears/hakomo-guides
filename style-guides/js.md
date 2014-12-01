#JavaScript Style Guide



##Table Of Contents
1. [Variables](#variables)
2. [Conditional Expressions](#conditionals)
3. [Arrays](#arrays)
4. [Strings](#strings)
5. [Blocks](#blocks)
6. [Functions](#functions)
7. [Objects](#objects)
8. [Properties](#properties)
9. [Whitespace](#whitespace)
10. [Commas](#commas)
11. [Naming Conventions](#naming-conventions)
12. [Comments](#comments)



###Variables
- Always use `var` to declare variables. Not doing so will result in global variables polluting the global namespace.

	```javascript
	// bad
	pesho = new Pesho();

	// good
	var pesho = new Pesho();
	```

- Use `var` for every declared variable.
	```javascript
	// bad
	var pesho = 'gosho',
		alienNinja = 'awesome!',
		setHumorTo = '10%';

	// good
	var pesho = 'gosho';
	var	alienNinja = 'awesome!';
	var	setHumorTo = '100%';
	```
- Declare unassigned variables last.
	```javascript
	// bad
	var i, j, length;
	var pesho = 'gosho';

	// good
	var pesho = 'gosho';
	var length;
	var	i;
	var	j;
	```
- Always assign variables at the top of their scope.
	```javascript
	// bad
	function() {
		doSomethingBeforeVar();

		if (condition) {
			doAnotherThing()
		}

		var theVariable = 9999999;

		return 'pesho';
	}

	// good
	function() {
		var theVariable = 9999999;

		doSomethingBeforeVar();

		if (condition) {
			doAnotherThing()
		}

		return 'pesho';
	}

	```

[Back to top](#table-of-contents)

###Conditionals
- Use `===` and `!==` over `==` and `!=`.
- Conditional expressions are evaluated using coercion and always follow these rules:
	- **Objects** evaluate to **true**
	- **Undefined** evaluates to **false**
	- **Null** evaluates to **false**
	- **Booleans** evaluate to **the value of the boolean**
	- **Numbers** evaluate to **false** if **+0, -0 or NaN**, otherwise **true**
	- **Strings** evaluate to **false** if an empty string `''`, otherwise **true**


	```javascript
	if ([0]) {
		// true
		// because an array is an object and objects evaluate to true
	}
	```

-  Use shortcuts
	```javascript
	// bad
	if (name !== '') {
	  // ...stuff...
	}

	// good
	if (name) {
	  // ...stuff...
	}

	// bad
	if (collection.length > 0) {
	  // ...stuff...
	}

	// good
	if (collection.length) {
	  // ...stuff...
	}
	```

[Back to top](#table-of-contents)

###Arrays
- Use the literal syntax for array creation
	```javascript
	// bad
	var numbers = new Array();

	// good
	var numbers = [];
	```

- When you need to copy an array use `.slice()`
	```javascript
	var len = items.length,
	    itemsCopy = [],
	    i;

	// bad
	for (i = 0; i < len; i++) {
	  itemsCopy[i] = items[i];
	}

	// good
	itemsCopy = items.slice();
	```

[Back to top](#table-of-contents)

###Strings
- Use single quotes `''` for strings
	```javascript
	// bad
	var name = "Unufri Stavrev";

	// good
	var name = 'Unufri Stavrev';

	// bad
	var fullName = "Dick " + this.lastName;

	// good
	var fullName = 'Dick ' + this.lastName;
	```
- Strings longer than 80 characters should be written across multiple lines using string concatenation
	```javascript
	// bad
	var errorMessage = 'This is a super long error that was thrown because of Batman. When you stop to think about how Batman had anything to do with this, you would get nowhere fast.';

	// bad
	var errorMessage = 'This is a super long error that was thrown because \
	of Batman. When you stop to think about how Batman had anything to do \
	with this, you would get nowhere \
	fast.';

	// good
	var errorMessage = 'This is a super long error that was thrown because ' +
	  'of Batman. When you stop to think about how Batman had anything to do ' +
	  'with this, you would get nowhere fast.';
	```

[Back to top](#table-of-contents)

###Blocks
- Use braces with all multi-line blocks
	```javascript
	// bad
	if (test)
	    return false;

	// good
	if (test) return false;

	// good
	if (test) {
	    return false;
	}

	// bad
	function() { return false; }

	// good
	function() {
	    return false;
	}
	```

[Back to top](#table-of-contents)

###Functions
- Function expressions
	```javascript
	// anonymous function expression
	var anonymous = function() {
		return true;
	};

	// named function expression
	var named = function named() {
		return true;
	}

	// immediately-invoked function expression (IIFE)
	(function() {
		// do awesome stuff here
	})();
	```
- Function declaration
	```javascript
	function awesomeFunction() {
		return true;
	}
	```
- Never declare a function in a non-function block (if, while, etc).
- Never name a parameter arguments, this will take over the `arguments` object that is givent to every function scope
	```javascript
	// bad
	function nope(name, options, arguments) {
	  // ...stuff...
	}

	// good
	function yup(name, options, args) {
	  // ...stuff...
	}
	```

[Back to top](#table-of-contents)

###Objects
- Use the literal syntax for object creation
	```javascript
	// bad
	var item = new Object();

	// good
	var item = {};
	```
- Don't use [reserved words](http://es5.github.io/#x7.6.1) as keys

[Back to top](#table-of-contents)

###Properties
- Use dot notation when accessing properties
	```javascript
	var luke = {
	  jedi: true,
	  age: 28
	};

	// bad
	var isJedi = luke['jedi'];

	// good
	var isJedi = luke.jedi;

	/*
		an exception is when the key you want
		to access has a hyphen separating the
		the words that form it
	*/

	var luke = {
		is-jedi: true
	};

	var isJedi = luke['is-jedi'];
	```

[Back to top](#table-of-contents)

###Whitespace
- Use soft tabs set to 4 spaces
	```javascript
	// bad
	function() {
	..return false;
	}

	// worse
	function() {
	.return false;
	}

	// good
	function() {
	....return false;
	}

- Place 1 space before the leading brace
	```javascript
	// bad
	function test(){
	  console.log('test');
	}

	// good
	function test() {
	  console.log('test');
	}

	// bad
	dog.set('attr',{
	  age: '1 year',
	  breed: 'Bernese Mountain Dog'
	});

	// good
	dog.set('attr', {
	  age: '1 year',
	  breed: 'Bernese Mountain Dog'
	});
	```
- Set off operators with spaces
	```javascript
	// bad
	var x=y+5;

	// good
	var x = y + 5;
	```
- Use indentation when making long method chains
	```javascript
	// bad
	$('#items').find('.selected').highlight().end().find('.open').updateCount();

	// good
	$('#items')
		.find('.selected')
			.highlight()
			.end()
	    .find('.open')
	    	.updateCount();
	```

[Back to top](#table-of-contents)

###Commas
- Leading commas. **Nope**
	```javascript
	// bad
	var person = {
		firstName: 'Unufri'
	  , lastName: 'Stavrev'
	  , age: 20
	}

	// good
	var person = {
		firstName: 'Unufri',
		lastName: 'Stavrev',
		age: 20
	}
	```

[Back to top](#table-of-contents)

###Naming Conventions
- Avoid single letter names. Be descriptive with your naming.
	```javascript
	// bad
	function q() {
	  // ...stuff...
	}

	// good
	function query() {
	  // ..stuff..
	}
	```
- Use camelCase when naming objects, functions, and instances
	```javascript
	// bad
	var MyObject = {};
	var my_other_object = {};

	var u = new user({});

	// good
	var thatsBetter = {};
	var thatToo = {};

	var user = new User({});
	```
- Use PascalCase when naming constructors or classes
	```javascript
	// bad
	function user(options) {
	  this.name = options.name;
	}

	var bad = new user({
	  name: 'nope'
	});

	// good
	function User(options) {
	  this.name = options.name;
	}

	var good = new User({
	  name: 'yup'
	});
	```
- Use a leading underscore `_` when naming private properties
	```javascript
	// bad
	this.__firstName__ = 'Panda';
	this.firstName_ = 'Panda';

	// good
	this._firstName = 'Panda';
	```

[Back to top](#table-of-contents)

###Comments
- Use `/** ... */` for multiline comments. Include a description, specify types and values for all parameters and return values.
	```javascript
	/**
	 * make() returns a new element
	 * based on the passed in tag name
	 *
	 * @param <String> tag
	 * @return <Element> element
	 */
	function make(tag) {

	  // ...stuff...

	  return element;
	}
	```
- Use `//` for single line comments. Place single line comments on a newline above the subject of the comment. Put an empty line before the comment.
	```javascript
	// bad
	var notGood = true // don't do that

	// good
	// that's better
	var awesome = true
	```

[Back to top](#table-of-contents)
