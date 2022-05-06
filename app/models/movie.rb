# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord

def director
  d_id = self.director_id
  matching_directors = Director.where({:id => d_id})
  the_director =  matching_directors.at(0)
  return the_director 
end

def cast
  # stretch goal:
  # return the actors associated to one movie
  # get list of characters
  # for each character, get the actor
  # save actor in a list
  # return list of actors 

  #my_id =self.id
  #list_of_actors = Array.new
  #list_of_characters =  Character.where ({:movie_id => my_id })
  #list_of_characters.each do |a_character|
    #c_actor_id = a_character.actor_id
    #actor = Actor.where ({ :id => c_actor_id }).at(0)
    #list_of_actors.push(actor)
  #end
  #return list_of_actors
#end

    my_id = self.id
    list_of_characters = Character.where({ :movie_id => my_id })
    list_of_actor_ids = list_of_characters.map_relation_to_array(:actor_id)
    list_of_actors = Actor.where({ :id => list_of_actor_ids })
    return list_of_actors
  end


end
