const Util = require('./util.js');
const Asteroid = require('./asteroid.js');

function Game(options) {
  this.asteroids = [];

  for(let i = 0; i < options["num_asteroids"]; i++) {
    this.asteroids.push(new Asteroid(Util.randomVec(400), Util.randomVec()));
  }
}

function Foo() {
  this.scope1 = function() {
    // console.log("scope1");
    // scope2();
    // scope3();
    // return undefined;
    return {
      foo: function() {
        scope2();
      },

      bar: function() {
        scope3();
      }
    };
  };

  function scope2() {
    console.log("scope2");
  }

  var scope3 = function() {
    console.log("scope3");
  };
}

Foo.prototype.scopeProto = function() {
  this.scope1();
  // scope2();
  // scope3();
};
//
let f = new Foo();
console.log();
console.log("this is scopes");
console.log(f);
console.log(f.__proto__);
console.log(f.scopeProto());
console.log(f.scope2());


var foo = {
  method1: function() {
    console.log('yo');
  },

  method2: function() {
    this.method1();
  }
};

console.log(foo);
foo.method1();
foo.method2();
