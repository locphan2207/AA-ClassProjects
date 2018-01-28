import React from 'react';

class Clock extends React.Component {
  constructor() {
    super();
    this.state = {time: new Date()};
  }

  render() {
    return (
      <div className="widget-clock">
        <h1 className="widget-clock-label">Clock</h1>
        <div className="timedate-container">
          <h2>Time: <span>{this.state.time.toTimeString().slice(0,8)}</span></h2>
          <h2>Date: <span>{this.state.time.toDateString()}</span></h2>
        </div>
      </div>
    );
  }

  componentDidMount() {
    this.tick();
  }

  componentWillUnmount() {
    clearInterval(this.intervalID);
  }

  tick() {
    this.intervalID = setInterval(() => {
      this.setState({time: new Date()});
    }, 1000);
  }
}

export default Clock;
