import React from 'react';
import TabHeaders from './tab_headers';

class TabList extends React.Component {
  constructor({tabList}) {
    super();
    this.tabList = tabList;
    // console.log(this.tabList);
    this.state = {openedTabIndex: 0};
    this.updateOpenedTabIndex = this.updateOpenedTabIndex.bind(this);
  }

  titleList() {
    const titleList = [];
    this.props.tabList.forEach((tab) => {
      titleList.push(tab.title);
    });
    return titleList;
  }

  updateOpenedTabIndex(index) {
    // return ()=>{return index;};
    this.setState({openedTabIndex: index});
  }

  render() {
    const currentTab = this.props.tabList[this.state.openedTabIndex];
    console.log(this.props.tabList[this.state.openedTabIndex]);
    return (
      <div>
        <TabHeaders
          titleList={this.titleList()}
          index={this.state.openedTabIndex}
          updateOpenedTabIndex={this.updateOpenedTabIndex}
        />
        <p>{currentTab.content}</p>
      </div>
    );
  }
}

export default TabList;
