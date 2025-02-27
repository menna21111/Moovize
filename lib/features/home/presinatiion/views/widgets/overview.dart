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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('overview',style: TextStyle(color: kwhitecolor,fontSize: 14,fontWeight: FontWeight.bold),),
              GestureDetector(
                onTap: () {
                       context
                            .read<ReviewBloc>()
                            .add(MovIEGETReview(moviedetails.id ?? 278));
          
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Reviewscrean(
                            id: moviedetails.id ?? 278,
                          );
                        }));
                },
                child: const Text('view reviews',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,   color: Colors.yellow,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.yellow,),)),
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
        const Text('release date',style: TextStyle(color: kwhitecolor,fontSize: 14,fontWeight: FontWeight.bold ),),
        Text('${moviedetails.releaseDate}',style: const TextStyle(color: kgreycolor,fontSize: 14,fontWeight: FontWeight.w500),),
      ],
    ),
   SizedBox()
,    Column(
      children: [
        const Text('originalLanguage',style: TextStyle(color: kwhitecolor,fontSize: 14,fontWeight: FontWeight.bold),),
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
        const Text('Budget',style: TextStyle(color: kwhitecolor,fontSize: 14,fontWeight: FontWeight.bold),),
        Text('\$${moviedetails.budget}',style: const TextStyle(color: kgreycolor,fontSize: 14,fontWeight: FontWeight.w500),),
      ],
    ),
   const SizedBox()
,    Column(
      children: [
        const Text('Revenue',style: TextStyle(color: kwhitecolor,fontSize: 14,fontWeight: FontWeight.bold),),
        Text('\$${moviedetails.revenue}',style: const TextStyle(color: kgreycolor,fontSize: 14,fontWeight: FontWeight.w500),),
      ],
    ),
  ],),
      ],
    );
  }
}