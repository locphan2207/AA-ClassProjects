
// pos = [x, y]

// function Vector() {}
//
// Vector.prototype.distance = function(pos1, pos2) {
//   return Math.sqrt(
//     Math.pow((pos2[0] - pos1[0]), 2) +
//     Math.pow((pos2[1] - pos1[1]), 2)
//   );
// };
//
// Vector.prototype.norm = function(pos) {
//   return this.distance([0, 0], pos);
// };

// Vector.prototype.randomVec = function(length) {
function randomVec(length) {
  const deg = 2 * Math.PI * Math.random();
  return Util.scale([Math.sin(deg), Math.cos(deg)], length);
}

// function

const Util = {
  // double check! inherits: function () {}
  inherits(childClass, parentClass) {
    function Surrogate() {}
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
    childClass.prototype.constructor = childClass;
  },

  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  },

  randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },

  distance(pos1, pos2) {
    return Math.sqrt(
      Math.pow((pos2[0] - pos1[0]), 2) +
      Math.pow((pos2[1] - pos1[1]), 2)
    );
  },

  norm(pos) {
    return this.distance([0, 0], pos);
  }
};


module.exports = {
  "Util": Util
};
