def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie
    .select(:title, :id)
    .joins(:actors)
    .where('actors.name IN (?)', those_actors)
    .group(:id)
    .having('COUNT(movies.id) >=2')
end

def golden_age
  # Find the decade with the highest average movie score.
  year = Movie
    .select('(yr/10) AS decade')
    .group('yr/10')
    .order('AVG(score) DESC')
    .limit(1)
    .pluck('(yr/10)*10')
  year.first
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  sub_query = Casting
    .select(:movie_id)
    .joins(:actor)
    .where("actors.name = ?", name)
    .pluck(:movie_id)
  # p sub_query
  Actor
    .select(:name).distinct
    .joins(:castings)
    .where('castings.movie_id IN (?)', sub_query)
    .where.not('name = ?', name)
    .pluck(:name)
end

def actor_out_of_work
  # left join
    actors_with_work = Casting
    .select(:actor_id)
    .pluck(:actor_id)

    Actor
    .select('COUNT(actors.name)')
    .where.not('actors.id IN (?)', actors_with_work)
    .pluck('COUNT(actors.name)').first


  # Find the number of actors in the database who have not appeared in a movie

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
end
