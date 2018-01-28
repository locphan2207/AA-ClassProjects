import _ from 'lodash';

export const selectAllPokemon = (state) => {
  return _.values(state.entities.pokemon);
};

// state only -> [{entities: {...}}]
// state.entities ->  [{pokemon: {...}}]
// state.entities.pokemon ->  [{},{},...]
