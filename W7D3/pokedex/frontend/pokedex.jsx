import React from 'react';
import ReactDOM from 'react-dom';
import * as APIUtil from './util/api_util';
import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions';
import configureStore from './store/store';
import {selectAllPokemon} from './reducers/selectors';
import Root from './components/root';

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
  window.getState = store.getState;
  window.dispatch = store.dispatch;
});

window.receiveAllPokemon = receiveAllPokemon;
window.fetchAllPokemon = APIUtil.fetchAllPokemon;
window.requestAllPokemon = requestAllPokemon;
window.selectAllPokemon = selectAllPokemon;
