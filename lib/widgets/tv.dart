import 'package:flutter/material.dart';
import '../description.dart';
import '../utils/text.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({required this.tv});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modified_text(
            text: 'Popular TV Shows',
            size: 26,
          ),
          SizedBox(height: 10),
          Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Description(
                                  name: tv[index]['title'] ?? 'Data not availabele',
                                  bannerurl: tv[index]['backdrop_path'] != null
                                      ? 'https://image.tmdb.org/t/p/w500' + tv[index]['backdrop_path']
                                      : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',
                                  posterurl: tv[index]['poster_path'] != null
                                      ? 'https://image.tmdb.org/t/p/w500' + tv[index]['poster_path']
                                      : 'https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg',
                                  description: tv[index]['overview'] ?? 'Data not availabele',
                                  vote: tv[index]['vote_average']?.toString() ?? '0.00',
                                  launch_on: tv[index]['release_date'] ?? 'Data not availabele',
                                )
                            )
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 250,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: tv[index]['backdrop_path'] !=null ? NetworkImage(
                                        'https://image.tmdb.org/t/p/w500'+
                                            tv[index]['backdrop_path']) : NetworkImage('https://thumbs.dreamstime.com/z/error-sign-error-message-white-background-error-sign-error-message-simple-vector-icon-125098995.jpg'),
                                    fit: BoxFit.cover),
                              ),
                              height: 140,
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: modified_text(
                                  size: 15,
                                  text: tv[index]['original_name'] != null
                                      ? tv[index]['original_name']
                                      : 'Loading'),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}