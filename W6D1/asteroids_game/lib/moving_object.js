

function MovingObject(options) {
  this.pos = options['pos'];
  this.vel = options['vel'];
  this.radius = options['radius'];
  this.color = options['color'];
}

MovingObject.prototype.draw = function(ctx) {
  ctx.save();
  ctx.moveTo(this.pos[0], this.pos[1]);
  ctx.fillStyle = this.color;
  ctx.arc(0, 0, this.radius, 0, 2 * Math.PI); //draw circle
  ctx.fill();
  ctx.restore();  //canvas pos goes back
};

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
};

module.exports = MovingObject;
