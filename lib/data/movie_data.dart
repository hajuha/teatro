import 'package:flutter/material.dart';

class MovieData {
  List<MovieModel> movieList;

  MovieData() {
    movieList = List<MovieModel>();

    movieList.add(
      MovieModel(
        id: 3,
        name: 'Blood Red Sky',
        rating: 7.7,
        actors:
            "Aleksandar Erakovic, Kosta Jovic, Maja Nedeljkovic, Nikolija Apostolovic",
        genre: ["Action", "Adventure"],
        storyLine:
            "A woman with a mysterious illness is forced into action when a group of terrorists attempt to hijack a transatlantic overnight flight. In order to protect her son she will have to reveal a dark secret, and unleash the inner monster she has fought to hide.",
        image: Image.network(
            "https://image.tmdb.org/t/p/original/ky8Fua6PD7FyyOA7JACh3GDETli.jpg"),
      ),
    );
    movieList.add(
      MovieModel(
        name: 'Fear Street',
        rating: 7.5,
        actors: "Rosamund Pike, Peter Dinklage, Eiza González",
        genre: ['Horror', 'Mystery'],
        image: Image.network(
            "https://image.tmdb.org/t/p/original/5dNTxhoGDTHHGqUTdxcr4H1dqlU.jpg"),
        storyLine:
            "In 1978, two rival groups at Camp Nightwing must band together to solve a terrifying mystery when horrors from their towns' history come alive.",
        id: 591274,
      ),
    );
    movieList.add(
      MovieModel(
          name: 'Avengers',
          rating: 8.3,
          actors: "Alex Barima, James Blight, Michael Daingerfield",
          genre: ['Adventure', 'Science Fiction', 'Action'],
          image: Image.network(
              "https://image.tmdb.org/t/p/original/or06FN3Dka5tukK1e9sl16pB3iy.jpg"),
          storyLine:
              "After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos' actions and restore order to the universe once and for all, no matter what consequences may be in store.",
          id: 299534),
    );
    movieList.add(
      MovieModel(
          name: 'No Sudden Move',
          rating: 6.7,
          actors:
              "Michael Jai White, Michael Eklund, Sabryn Rock, Nakai Takawira",
          genre: ['Crime', 'Drama', 'Thriller', 'Mystery'],
          image: Image.network(
              "https://image.tmdb.org/t/p/original/34BmdJkdvRweC3xJJFlOFQ2IbYc.jpg"),
          storyLine:
              "A group of criminals are brought together under mysterious circumstances and have to work together to uncover what's really going on when their simple job goes completely sideways.",
          id: 649409),
    );
    movieList.add(
      MovieModel(
          name: 'The Suicide',
          rating: 0,
          genre: ['Action', 'Adventure', 'Comedy', 'Crime'],
          image: Image.network(
              "https://image.tmdb.org/t/p/original/iXbWpCkIauBMStSTUT9v4GXvdgH.jpg"),
          storyLine:
              'Supervillains Harley Quinn, Bloodsport, Peacemaker and a collection of nutty cons at Belle Reve prison join the super-secret, super-shady Task Force X as they are dropped off at the remote, enemy-infused island of Corto Maltese.',
          id: 436969),
    );
    movieList.add(
      MovieModel(
          name: 'Mortal Kombat',
          rating: 7.5,
          genre: ['Action', 'Fantasy', 'Adventure'],
          image: Image.network(
              "https://image.tmdb.org/t/p/original/nkayOAUBUu4mMvyNf9iHSUiPjF1.jpg"),
          storyLine:
              "Washed-up MMA fighter Cole Young, unaware of his heritage, and hunted by Emperor Shang Tsung's best warrior, Sub-Zero, seeks out and trains with Earth's greatest champions as he prepares to stand against the enemies of Outworld in a high stakes battle for the universe.",
          id: 460465),
    );
    movieList.add(
      MovieModel(
          name: 'Fear Street',
          rating: 6.8,
          actors: "Jennifer Carpenter, Joel McHale, Ike Amadi",
          genre: ['Horror', 'Mystery'],
          image: Image.network(
              "https://image.tmdb.org/t/p/original/9J9Wy39ZjrVmfk7yMkulpcI5sy0.jpg"),
          storyLine:
              'In 1994, a group of teenagers discovers that the terrifying events which have haunted their town for generations ​are all connected — and that they may be the next targets.',
          id: 591273),
    );
    movieList.add(
      MovieModel(
        id: 0,
        name: 'Dolittle',
        rating: 5.6,
        actors: "Robert Downey Jr., Antonio Banderas, Michael Sheen",
        genre: ["Family", "Adventure"],
        storyLine:
            "Dr. John Dolittle lives in solitude behind the high walls of his lush manor in 19th-century England. His only companionship comes from an array of exotic animals that he speaks to on a daily basis. But when young Queen Victoria becomes gravely ill, the eccentric doctor and his furry friends embark on an epic adventure to a mythical island to find the cure.",
        image: Image.asset("assets/image/doliSttle.jpg"),
        imageText: Image.asset("assets/image/dolittle-text.png"),
      ),
    );
    movieList.add(
      MovieModel(
        id: 1,
        name: 'Mulan',
        rating: 4.0,
        actors: "Liu Yifel, Donnie Yen, Gong Li",
        genre: ["Action", "Adventure"],
        storyLine:
            "Fearful that her ailing father will be drafted into the Chinese military, Mulan (Ming-Na Wen) takes his spot -- though, as a girl living under a patriarchal regime, she is technically unqualified to serve. She cleverly impersonates a man and goes off to train with fellow recruits. Accompanied by her dragon, Mushu (Eddie Murphy), she uses her smarts to help ward off a Hun invasion, falling in love with a dashing captain along the way.",
        image: Image.asset("assets/image/mulan.jpg"),
        imageText: Image.asset("assets/image/mulan-text.png"),
      ),
    );
    movieList.add(
      MovieModel(
        id: 2,
        name: 'Black Widow',
        rating: 7.0,
        actors: "Jessy Moravec, Daniel Hensch, Nicola Bokardo",
        genre: ["Action", "Adventure"],
        storyLine:
            "At birth the Black Widow (aka Natasha Romanova) is given to the KGB, which grooms her to become its ultimate operative. When the U.S.S.R. breaks up, the government tries to kill her as the action moves to present-day New York, where she is a freelance operative.",
        image: Image.asset("assets/image/blackwidow.jpg"),
        imageText: Image.asset("assets/image/blackwidow-text.png"),
      ),
    );
  }
}

class MovieModel {
  int id;
  String name;
  List<String> genre;
  double rating;
  String storyLine;
  String actors;
  Image image;
  Image imageText;

  MovieModel(
      {this.id,
      this.genre,
      this.name,
      this.rating,
      this.storyLine,
      this.actors,
      this.image,
      this.imageText});
}
