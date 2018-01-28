// 'use strict';

const sum = function(...args) {
  let total = 0;
  for(let num of args) {
    total += num;
  }
  return total;
};

console.log(sum(1,2,3));




Function.prototype.myBind = function(ctx, ...bindArgs) {
  return (...callArgs) =>  this.apply(ctx, bindArgs.concat(callArgs));
};

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "me"
markov.says.myBind(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!
// true




Function.prototype.curry = function (numArgs) {
  let numbers = [];
  let fn = this;

  return function _curriedFn(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      return fn(...numbers);
    }

    return _curriedFn;
  };
};


function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
console.log("f1: " + f1);

f1 = f1(20); // [Function]
console.log("f1: " + f1);

f1 = f1(6); // = 30
console.log("f1: " + f1);


console.log(sumThree.curry(3)(4)(20)(6));





function curriedSum (numArgs) {
  let numbers = [];

  return function _curriedSum(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      return sum(...numbers);
    }

    return _curriedSum;
  };
}

const sumCurry = curriedSum(4);
const sumCurry2 = curriedSum(3);

console.log(sumCurry);

console.log(sumCurry(5));
console.log(sumCurry2(-5));

console.log(sumCurry(30));
console.log(sumCurry2(-30));

console.log(sumCurry(20));
console.log("curry2: " + sumCurry2(-20));

console.log("curry1: " + sumCurry(5)(30)(20)(1));
