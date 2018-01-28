import {createStore, applyMiddleware} from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = () => createStore(
  rootReducer
);


export default configureStore;
