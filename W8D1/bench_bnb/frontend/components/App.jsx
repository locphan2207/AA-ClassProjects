import React from 'react';
import GreetingContainer from './greeting_container';
import SessionFormContainer from './session_form_container';
import {Route, Switch} from 'react-router-dom';
import {AuthRoute} from '../util/route_util';

const App = () => (
  <div>
    <header>
      <h1>BenchBnB</h1>
      <GreetingContainer />
      <Switch>
        <AuthRoute path="/signup" component={SessionFormContainer} />
        <AuthRoute path="/login" component={SessionFormContainer} />
      </Switch>
    </header>
  </div>
);

export default App;
