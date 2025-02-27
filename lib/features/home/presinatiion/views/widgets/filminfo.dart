import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:icons_plus/icons_plus.dart';

import 'package:shimmer/shimmer.dart';



class MovieInfoSection extends StatelessWidget {
  const MovieInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[900]!,
          highlightColor: Colors.grey[700]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 150,
                height: 12,
              ),
           SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 70,
                height: 12,
              ),
              SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 50,
                height: 12,
              ),
               SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 100,
                height: 12,
              ), SizedBox(height: 5,),
            ],
          ),
        ),
     
        RatingBar.builder(
          itemPadding: EdgeInsets.all(0),
          itemSize: 18,
          initialRating: 5, 
          maxRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          glow: false,
          itemBuilder: (context, index) {
            return const Icon(
              EvaIcons.star,
              color: Colors.grey,
            );
          },
          onRatingUpdate: (value) {},
        ),
         SizedBox(height: 5,),
      ],
    );
  }
}
