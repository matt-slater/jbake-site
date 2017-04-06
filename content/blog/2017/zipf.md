title=Spotify Puzzle Challenge: Zipf's Song
date=2017-04-05
type=post
tags=blog, java, coding challenge
status=published
summary=I recently came across Spotify Engineering's twitter and blog after reading about their open-sourced java microservices framework, Apollo. After reading a fascinating article about the many interesting ways the company uses DNS, I noticed the "Puzzles" page and had to check it out.
~~~~~~

I recently came across Spotify Engineering's [twitter](https://twitter.com/spotifyeng) and [blog](https://labs.spotify.com/) after reading about their open-sourced java microservices framework, [Apollo](https://spotify.github.io/apollo/). After reading a fascinating article about the many interesting ways the company uses DNS, I noticed the "Puzzles" page and had to check it out.

The puzzles page lists three problems of varying difficulty (easy, medium, hard) that, you guessed it, are programming exercises. The problem I chose was "Zipf's Song." You are given a list of songs on an album and their play counts and you must find out which tracks are the most popular. The catch is that the songs with the most plays are not necessarily the most popular tracks. If all songs are equal, the play frequencies of each song will fall off in accordance with Zipf's Law: Given a track number *t*, it should get 1/ *t* the number of listens as the first track.

The algorithm to solve this is simple. for any track, the quality is determined by the track number *t* multiplied by the number of plays *p*. Once the relative qualities of each track are determined, one can evaluate the tracks on a level playing field.

For my [solution](https://github.com/matt-slater/spotify/tree/master/zipf/src/main/java), I chose to implement my own data structure to encapsulate the data needed for each track:

```java
class Song implements Comparable<Song> {

    private double quality;
    private String title;

    public Song(String title, double quality) {
        this.title = title;
        this.quality = quality;
    }

    @Override
    public int compareTo(Song o2) {
        if (this.quality < o2.getQuality()) {
            return 1;
        } else if (this.quality > o2.getQuality()) {
            return -1;
        } else {
            return 0;
        }
    }

    //getters, setters, toString()...

}
```

Since I needed to be able to return the top *n* tracks in order, I needed a way to compare two Song objects. This is where the `Comparable<T>` interface comes in. `Comparable<T>` is used to determine the natural order of objects. By choosing to override the `compareTo()` method, you'll be able to compare two objects that don't necessarily have a logical or apparent natural order. Originally, my solution used a custom `Comparator<T>` class that did pretty much the same thing, but I changed it because the solution didn't call for comparing songs in multiple ways.

I finished coding up the solution and sent it along to the judge via email. I patted myself on the back. That was easier than I thought.

I was denied. My solution was too slow. But how? I was using an `ArrayList<Song>` to store the album and the sort couldn't take that long, could it? I tried using a `PriorityQueue`. Still too slow.

Then it hit me. The culprit was `Scanner`. When I changed the input reader to Kattis' custom IO class , it worked like a charm. Kattis is the platform that is used to judge the submissions. I intended to use a `BufferedReader`, but Kattis' class makes working with `System.in` a lot less of a hassle.

```java
public static void main(String[] args) {

       Kattio in = new Kattio(System.in);

       long m = in.getLong();
       long n = in.getLong();

       ArrayList<Song> songArrayList = new ArrayList<Song>();

       //add first song

       long plays = in.getLong();
       String firstTitle = in.getWord();
       songArrayList.add(new Song(firstTitle, plays));

       //add rest of songs

       for (long i = 0; i < m - 1; i++) {
           long numPlays = in.getLong();
           String title = in.getWord();
           songArrayList.add(new Song(title, (numPlays * (i+2))));
       }

       Collections.sort(songArrayList);

       for (int i = 0; i < n; i++) {
           System.out.println(songArrayList.get(i).getTitle());
       }

   }
}
```

Finally accepted. My reward? An email that read:

>Hello Matt Slater,
>
>Thank you for submitting a solution to our problem "zipfsong"!
>We have tested your solution, and we are happy to report that it
>solved the problem!  We hope you had as fun with it as we did.
>
>Yours truly,
>
>Spotify
