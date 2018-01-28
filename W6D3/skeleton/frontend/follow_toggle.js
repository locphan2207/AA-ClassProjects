const APIUtil = require ('./api_util');

class FollowToggle {
  constructor($el) {
    this.$el = $el;
    this.userId = $el.attr('data-user-id');
    this.followState = $el.attr('data-initial-follow-state');
    this.render();
    this.$el.on("click", this.handleClick.bind(this));
  }

  render() {
    if (this.followState === "unfollowed") {
      this.$el.text("Follow!");
    } else {
      this.$el.text("Unfollow!");
    }
  }

  handleClick(e) {
    e.preventDefault();
    this.$el.prop("disabled", true);
    if (this.followState === "unfollowed") {
      APIUtil.followUser(this.userId).then(() => {
        this.followState = "followed";
        this.render();
        this.$el.prop("disabled", false); //Why this needs to be here?
      });
    } else {
      APIUtil.unfollowUser(this.userId).then(() => {
        this.followState = "unfollowed";
        this.render();
        this.$el.prop("disabled", false); //Why this needs to be here?
      });
    }
  }
}

module.exports = FollowToggle;
