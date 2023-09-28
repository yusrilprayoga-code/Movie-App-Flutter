import 'package:flutter/material.dart';
import 'package:Tixflix/constants/constants.dart';

class UpcomingMovies extends StatelessWidget {
  const UpcomingMovies({
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
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
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
          );
        },
      ),
    );
  }
}
