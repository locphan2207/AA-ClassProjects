import React from 'react';

class TabHeaders extends React.Component {
  constructor(props) {
    super(props);
    this.titleList = this.props.titleList;
    this.index = this.props.index;
    this.updateOpenedTabIndex = this.props.updateOpenedTabIndexthis;
  }

  render() {
    console.log(this.updateOpenedTabIndex.bind(null));
    return (
      <ul>
        {
          this.titleList.map((title, index) => (
            <li key={index}
              onClick={this.updateOpenedTabIndex.bind(null, index)}>
              {title}
            </li>
          ))
        }
      </ul>
    );
  }
}

export default TabHeaders;
