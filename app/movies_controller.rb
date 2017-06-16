def can_be_instantiated_and_then_saved
  movie = Movie.create
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.create(attributes)
end

def can_be_created_in_a_block
  Movie.create do |m|
    m.title = "Home Alone"
    m.release_date = 1990
  end
end

def can_get_the_first_item_in_the_database
  Movie.all.first.title
end

def can_get_the_last_item_in_the_database
  Movie.all.last.title
end

def can_get_size_of_the_database
  Movie.all.size
end

def can_find_the_first_item_from_the_database_using_id
  mov = Movie.find_by id: 1
  mov.title
end

def can_find_by_multiple_attributes
  mov = Movie.find_by title: "Title", release_date: 2000, director: "Me"
end

def can_find_using_where_clause_and_be_sorted
  Movie.where("release_date > ?", 2002).order("release_date DESC")
end

def can_be_found_updated_and_saved
  Movie.create(title: "Awesome Flick")
  mov = Movie.find_by title: "Awesome Flick"
  mov.update title: "Even Awesomer Flick"
  mov.save
end

def can_update_using_update_method
  Movie.create(title: "Wat?")
  mov = Movie.find_by title: "Wat?"
  mov.update title: "Wat, huh?"
end

def can_update_multiple_items_at_once
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  Movie.where(id: 1..5).each{|m| m.update({title: "A Movie"})}
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  mov = Movie.find_by title: "That One Where the Guy Kicks Another Guy Once"
  mov.destroy
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.destroy_all
end
