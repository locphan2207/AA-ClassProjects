import React from 'react';
import BenchIndex from './bench_index';
import BenchMap from './bench_map';

const Search = (props) => (
  <div>
    <BenchIndex
      benches={props.benches}
      fetchBenches={props.fetchBenches}
    />
    <BenchMap />
  </div>
);

export default Search;
