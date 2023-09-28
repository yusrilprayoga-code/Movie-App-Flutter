import 'package:Tixflix/constants/constants.dart';
import 'package:Tixflix/movie/Details_Movie.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        options: CarouselOptions(
          height: 300,
          aspectRatio: 16 / 9,
          viewportFraction: 0.55,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        itemBuilder: (context, itemIndex, PageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsMovie(
                    movie: snapshot.data[itemIndex],
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 300,
                width: 200,
                child: Image.network(
                  '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
