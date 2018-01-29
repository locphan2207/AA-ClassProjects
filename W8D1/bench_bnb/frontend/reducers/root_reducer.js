import {combineReducers} from 'redux';
import errorReducer from './errors_reducer';
import sessionReducer from './session_reducer';

const rootReducer = combineReducers({
  session: sessionReducer,
  errors: errorReducer
});

export default rootReducer;
