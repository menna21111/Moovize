import 'package:flutter/material.dart';

import '../../../../../core/constants/size.dart';
import '../../../../../core/widgets/cachedimage.dart';
import '../../../../../core/widgets/imob.dart';
import '../../../data/models/movie_responsemodel.dart';
import '../screan/filmscreanbody.dart';

class Gridfilms extends StatelessWidget {
  const Gridfilms({super.key, required this.movie});
  final List<Movie> movie;
  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return SliverGrid(
      
      delegate: SliverChildBuilderDelegate((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  Filmscreanbody( id: movie[index].id??278,movie:movie[index] ,)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                     width: Screan_size.width * .4,
               height: Screan_size.hieght * .22,
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Cachedimage(imageUrl: movie[index].posterPath??'', height: 0, width:0, borderraduis: .0),
                  ),
                ),
                const SizedBox(height: 8),
                 Text(
                movie[index].title??'' ,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Row(
                  children: [
          const     Imob(),
                    SizedBox(width: 4),
                    Text(
                      movie[index].voteAverage.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },childCount: movie.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
       
       
        childAspectRatio: 2 / 2.5,
      ),
    );
  }
}
