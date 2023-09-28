import 'package:flutter/material.dart';
import 'package:Tixflix/constants/Movie_List.dart';
import 'package:Tixflix/constants/constants.dart';

class DetailsMovie extends StatelessWidget {
  const DetailsMovie({
    super.key,
    required this.movie,
  });

  final MovieList movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //buatkan menjadi desain yang bagus
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                '${Constants.imagePath}${movie.backdropPath}',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Judul film
                          Text(
                            movie.title!,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Rating film
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                movie.voteAverage.toString(),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Tanggal rilis
                          Text(
                            "Release Date: " + movie.releaseDate!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Deskripsi film
                          Text(
                            movie.Overview!,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
