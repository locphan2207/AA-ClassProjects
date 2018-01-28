Function.prototype.inherits = function (SuperClass) {
  function Surrogate() {}
  Surrogate.prototype = SuperClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

function MovingObject (name) {
  this.name = name;
}

MovingObject.prototype.move = function() {
  console.log(`${this.name} moved!`);
};

function Ship () {
  MovingObject.call(this, ...arguments);
}
Ship.inherits(MovingObject);

Ship.prototype.navigate = function() {
  console.log("sailing the boat!");
};

function Asteroid () {
  MovingObject.call(this, ...arguments);
}
Asteroid.inherits(MovingObject);

Asteroid.prototype.navigate = function() {
  console.log("flying through space!");
};

let obj = new MovingObject('car');
let boat = new Ship('boaty');
let spaceRock = new Asteroid('space rock');

obj.move();
console.log();

boat.navigate();
boat.move();

console.log();
spaceRock.navigate();
spaceRock.move();
