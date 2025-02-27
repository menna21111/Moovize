import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../../../../core/widgets/cachedimage.dart';
import '../../../../../core/widgets/imob.dart';
import '../../../data/models/movie_responsemodel.dart';
import '../screan/filmscreanbody.dart';

class Topratedfilmbasedoncategrt extends StatelessWidget {
  const Topratedfilmbasedoncategrt({super.key, required this.movie});
  final List<Movie> movie;

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movie.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
               
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Filmscreanbody(id: movie[index].id??278,movie:movie[index] )));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                 width: Screan_size.width * .5,
                 height: Screan_size.hieght * .22,
                  decoration: BoxDecoration(
                  
                    color: kgreycolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Cachedimage(imageUrl: movie[index].posterPath??'movie', height: .19, width: .3, borderraduis: .02),
                ),
                Container(
                  width:Screan_size.width * .5 ,
                  child: Text(
                   movie[index].title??'movie' ,
                   maxLines: 2,
                    style: TextStyle(color: kwhitecolor),
                  ),
                ),
                Row(
                  children: [
                    Imob(),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      movie[index].voteAverage.toString(),
                      style: TextStyle(color: kwhitecolor),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
