import 'package:flutter/material.dart';
import '../description.dart';
import '../utils/text.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({Key? key, required this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text:
            'Top Rated Movies',
            size: 26, color:Colors.white,
          ),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
                itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                name: toprated[index]['title'] ?? 'Data not availabele',
                                bannerurl: toprated[index]['backdrop_path'] != null
                                    ? 'https://image.tmdb.org/t/p/w500' + toprated[index]['backdrop_path']
                                    : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',
                                posterurl: toprated[index]['poster_path'] != null
                                    ? 'https://image.tmdb.org/t/p/w500' + toprated[index]['poster_path']
                                    : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',
                                description: toprated[index]['overview'] ?? 'Data not availabele',
                                vote: toprated[index]['vote_average']?.toString() ?? '0.00',
                                launch_on:toprated [index]['release_date'] ?? 'Data not availabele',
                              )
                          )
                      );
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height : 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            toprated[index]['poster_path']))),
                          ),
                          Container(
                            child: modified_text(
                                size: 15,
                                text: toprated[index]['title'] != null
                                    ? toprated[index]['title']
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