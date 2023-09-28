import 'package:Tixflix/api/api.dart';
import 'package:Tixflix/constants/Movie_List.dart';
import 'package:Tixflix/movie/Top_Rated_Movies.dart';
import 'package:Tixflix/movie/Trending_Movies.dart';
import 'package:Tixflix/movie/Upcoming_Movies.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<MovieList>> trendingMovies;
  late Future<List<MovieList>> topRatedMovies;
  late Future<List<MovieList>> upComingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upComingMovies = Api().getupComingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo.png',
          height: 200,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Tambahkan margin kiri dan kanan
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height:
                      20), // Tambahkan jarak antara AppBar dan judul "Trending Movies"
              Text(
                "Trending Movies",
                style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: FutureBuilder(
                    future: trendingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return TrendingMovies(
                          snapshot: snapshot,
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const CircularProgressIndicator();
                    }),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Top Rated Movies",
                style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: FutureBuilder(
                    future: topRatedMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return TopRatedMovies(
                          snapshot: snapshot,
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const CircularProgressIndicator();
                    }),
              ),
              //upcoming movies
              SizedBox(
                height: 32,
              ),
              Text(
                "Upcoming Movies",
                style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: FutureBuilder(
                    future: upComingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return UpcomingMovies(snapshot: snapshot);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return const CircularProgressIndicator();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
