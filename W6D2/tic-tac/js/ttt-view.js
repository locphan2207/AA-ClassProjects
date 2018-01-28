class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const $ul = $('.grid');
    $ul.on("click", "li", (event) => {
      const $li = $(event.target);
      this.makeMove($li);
    });
  }

  makeMove($square) {
    const posString = parseInt($square.attr('pos'));
    //calculate pos:
    const row = Math.floor(posString/3);
    const col = posString%3;
    const pos = [row, col];
    console.log(this.game.currentPlayer);
    try {
      this.game.playMove(pos);
    } catch (e) {
        alert(e.msg);
        return;
    }

    //Make pos:
    $square.text(this.game.currentPlayer);
    $square.removeClass();
    $square.addClass('chosen');

    //Check if game is over:
    if (this.game.isOver()) {
      const $ul = $('.grid');
      if (this.game.winner()) {
        const $lists = $('.grid li');
        $.each( $lists, (idx, el) => {
          if ($(el).text() === this.game.currentPlayer) {
            $(el).removeClass();
            $(el).addClass('win');
          } else if ($(el).text() === this.game.winner()){
            $(el).removeClass();
            $(el).addClass('lose');
          }
        });
        this.$el.append($(`<p class=\"msg\">${this.game.currentPlayer} won!</p>`));
        $ul.off();
      } else {
        const $lists = $('.grid li');
        $lists.removeClass();
        $lists.addClass('lose');
        this.$el.append($("<p class=\"msg\">It's a Draw</p>"));
        $ul.off();
      }
    }
  }

  setupBoard() {
    const $ul = $("<ul></ul>");
    for (let i = 0; i < 9; i++) {
      const $li = $("<li></li>");
      $li.attr("pos", i.toString());
      $li.addClass("unchosen");
      $ul.append($li);
    }
    $ul.addClass("grid");
    this.$el.append($ul);
  }
}

module.exports = View;
