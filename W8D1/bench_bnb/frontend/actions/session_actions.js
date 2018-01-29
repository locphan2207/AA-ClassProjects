import * as APIUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

const receiveCurrentUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});

export const login = (user) => (dispatch) => {
  return APIUtil.login(user)
    .then((response) => dispatch(receiveCurrentUser(response.currentUser)))
    .catch((response) => dispatch(receiveErrors(response.errors)));
};

export const logout = () => (dispatch) => {
  return APIUtil.logout()
    .then((emptyResponse) => dispatch(receiveCurrentUser(emptyResponse)));
};

export const signup = (user) => (dispatch) => {
  return APIUtil.signup(user)
    .then((response) => dispatch(receiveCurrentUser(response.currentUser)))
    .catch((response) => dispatch(receiveErrors(response.errors)));
};
