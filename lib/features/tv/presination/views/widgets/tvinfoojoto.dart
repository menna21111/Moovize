import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../../data/model/tvdetails.dart';


class Tvinfoojoto extends StatelessWidget {
  const Tvinfoojoto({super.key, required this.movie});
  final TvShowDetails movie;

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: Screan_size.width * .5,
          child: Text(
            movie.originalName ?? 'movie',
            style: TextStyle(
              fontSize: 20,
              color: kwhitecolor,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Row(
          children: [
            Icon(
              Icons.visibility_outlined,
              color: kwhitecolor,
              size: 16,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              '${movie.popularity}',
              style: const TextStyle(
                fontSize: 13,
                color: kwhitecolor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        movie.adult ?? false
            ? Text(
                '18+',
                style: const TextStyle(
                  fontSize: 13,
                  color: kwhitecolor,
                ),
              )
            : Container(),
        SizedBox(
          height: 5,
        ),
        Text(
          '${movie.firstAirDate} ',
          style: TextStyle(
            fontSize: 13,
            color: kwhitecolor,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //  RatingBar.builder(
            //   itemPadding: EdgeInsets.all(0),
            //   itemSize: 18,
            //   initialRating: 3,
            //   maxRating: 1,
            //   glowColor:Colors.yellow,
            //   unratedColor: kgreycolor,
            //   direction: Axis.horizontal,
            //   allowHalfRating: true,
            //   itemCount: movie.voteAverage.toInt(),
            //   itemBuilder: (context, index) {
            //     return Icon(
            //       EvaIcons.star,
            //      color:Colors.yellow  ,
            //     );
            //   },
            //   onRatingUpdate: (rating) {

            //   }
            //   ),
            Icon(
              EvaIcons.star,
              color: Colors.yellow,
            ),
            Text(
              ' ${movie.voteAverage.toString()}',
              style: TextStyle(color: kwhitecolor),
            ),
            SizedBox(
              width: 40,
            ),
           
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
