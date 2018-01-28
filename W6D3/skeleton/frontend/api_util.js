const APIUtil = {
  followUser: id => {
    return $.ajax ({
      url: `/users/${id}/follow`,
      method: 'POST',
      dataType: 'json',
    });
  },

  unfollowUser: id => {
    return $.ajax ({
      url: `/users/${id}/follow`,
      method: 'DELETE',
      dataType: 'json',
    });
  },

  searchUsers: (queryVal, success) => {
    return $.ajax ({
      url: '/users/search', //why cant user prefix in ajax
      method: 'GET',
      dataType: 'json',
      success: success,
      data: {query}
    });
  }
};

module.exports = APIUtil;
