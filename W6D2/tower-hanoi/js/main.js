const Game = require('../solution/game.js');
const View = require('./view.js');

$( () => {
  const $rootEl = $('.hanoi');
  const game = new Game();
  const view = new View(game, $rootEl);
});
