import 'package:Tixflix/movie/Details_Movie.dart';
import 'package:flutter/material.dart';
import 'package:Tixflix/constants/constants.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsMovie(
                      movie: snapshot.data[index],
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                    height: 200,
                    width: 150,
                    child: Image.network(
                      '${Constants.imagePath}${snapshot.data![index].posterPath}',
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
