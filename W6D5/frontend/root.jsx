import React from "react";
import Clock from "./clock";
import TabList from "./tab_list";

const Root = () => {
  const tabList = [
    {title: 'tab1', content: 'content1'},
    {title: 'tab2', content: 'content2'},
    {title: 'tab3', content: 'content3'}
  ];
  return (
    <div>
      <Clock />
      <TabList tabList={tabList}/>
    </div>
  );
};


export default Root;
