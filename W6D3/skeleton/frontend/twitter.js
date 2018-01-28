const FollowToggle = require('./follow_toggle');
const UsersSearch = require('./users_search');

const cb = function() {
  let buttons = $('button.follow-toggle');
  for (let i = 0; i < buttons.length; i++) {
    let button = $(buttons[i]);
    let buttonToggle = new FollowToggle(button);
  }
  let $nav = $('.users-search');
  let usersSearch = new UsersSearch($nav);
};

$(() => {cb(); });
