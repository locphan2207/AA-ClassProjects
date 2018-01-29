import React from 'react';
import GreetingContainer from './greeting_container';
import SessionFormContainer from './session_form_container';
import {Route, Switch} from 'react-router-dom';

const App = () => (
  <div>
    <header>
      <h1>BenchBnB</h1>
      <Switch>
        <Route path="/signup" component={SessionFormContainer} />
        <Route path="/login" component={SessionFormContainer} />
        <Route component={GreetingContainer} />
      </Switch>
    </header>
  </div>
);

export default App;
