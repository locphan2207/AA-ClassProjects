export const fetchAllPokemon = () => {
  return $.ajax({
    method: 'GET',
    url: 'http://localhost:3000/api/pokemon',
  });
};
