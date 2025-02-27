import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../rating/presination/bloc/reviewbloc/bloc/review_bloc.dart';
import '../../../data/models/moviemodels/moviedetails.dart';
import 'reviewscrean.dart';


class Overview extends StatelessWidget {
  const Overview({super.key, required this.moviedetails});
final MovieDetails moviedetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('overview',style: TextStyle(color: Colors.yellow,fontSize: 14,fontWeight: FontWeight.bold),),
            
            ],
          ),
        ),
        Text('${moviedetails.overview}',style: const TextStyle(color: kgreycolor,fontSize: 14,fontWeight: FontWeight.w400),),
  SizedBox(height: 5),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Column(
      
      children: [
        const Text('release date',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold ),),
        Text('${moviedetails.releaseDate}',style: const TextStyle(color: kgreycolor,fontSize: 14,fontWeight: FontWeight.w500),),
      ],
    ),
   SizedBox()
,    Column(
      children: [
        const Text('originalLanguage',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
        Text('${moviedetails.originalLanguage}',style: const TextStyle(color: kgreycolor,fontSize: 14,fontWeight: FontWeight.w500),),
      ],
    ),
  ],),
  SizedBox(height: 5),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Column(
      
      children: [
        const Text('Budget',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
        Text('\$${moviedetails.budget}',style: const TextStyle(color: kgreycolor,fontSize: 14,fontWeight: FontWeight.w500),),
      ],
    ),
   const SizedBox()
,    Column(
      children: [
        const Text('Revenue',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
        Text('\$${moviedetails.revenue}',style: const TextStyle(color: kgreycolor,fontSize: 14,fontWeight: FontWeight.w500),),
      ],
    ),
  ],),
      ],
    );
  }
}