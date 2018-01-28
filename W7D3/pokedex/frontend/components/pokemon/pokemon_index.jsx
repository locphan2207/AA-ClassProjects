import React from 'react';
import PokemonIndexContainer from './pokemon_index_container';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render() {
    return (
      <li>
        {
          this.props.pokemon.map((poke) => (
            <div>
              <p>{poke.name}</p>
              <img width="100" src={poke.image_url}></img>
            </div>
          ))
        }
      </li>
    );
  }
}

export default PokemonIndex;
