const { Util } = require('./util.js');
const MovingObject = require('./moving_object.js');

console.log(Util);

function Asteroid(options) {
  this.COLOR = "#cccccc";
  this.RADIUS = "20px";
  options['color'] = this.COLOR;
  options['radius'] = this.RADIUS;
  // options['vel'] = Util.randomVec(10);

  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);


module.exports = Asteroid;
