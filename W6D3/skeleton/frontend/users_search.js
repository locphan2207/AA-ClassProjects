class UsersSearch {
  constructor($el) {
    this.$el = $el;
    this.$input = $el.find("input");
    this.$ul = $el.find("ul");
    console.log(this.$input);
    console.log(this.$ul);
  }
}

module.exports = UsersSearch;
