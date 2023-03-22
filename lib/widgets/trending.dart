import 'package:flutter/material.dart';
import 'package:movies_app/utils/text.dart';
import '../description.dart';


class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modified_text(
            text: "Trending Movies",
            size: 26, color: Colors.white,
          ),
          const SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: trending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Description(
    name: trending[index]['title'] ?? 'Data not availabele',
    bannerurl: trending[index]['backdrop_path'] != null
    ? 'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path']
        : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',
    posterurl: trending[index]['poster_path'] != null
    ? 'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path']
        : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',
    description: trending[index]['overview'] ?? 'Data not availabele',
    vote: trending[index]['vote_average']?.toString() ?? '0.00',
    launch_on: trending[index]['release_date'] ?? 'Data not availabele',
    )
    )
    );
    },

                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path']))),
                          ),

                          Container(
                            child: modified_text(
                                size: 15,
                                text: trending[index]['title'] != null
                                    ? trending[index]['title']
                                    : 'Loading'),

                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}


