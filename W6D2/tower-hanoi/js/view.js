class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupTowers();
  }

  setupTowers() {
    const $ul = $('<ul class="game"></ul>');
    for (let i = 0; i < 3; i++) {
      const $pile = $('<ul class="pile"></ul>');
      $pile.attr('pos', i);
      for (let j = 0; j < 3; j++) {
        const $disk = $('<li class="disk"></li>');
        $disk.attr('pos', i);
        $pile.append($disk);
      }
      $ul.append($pile);
    }
    this.$el.append($ul);
  }

  render() {
    
  }
}

module.exports = View;
