import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../data/model/tvdetails.dart';

class Overviewtv extends StatelessWidget {
  const Overviewtv({super.key, required this.moviedetails});
final TvShowDetails moviedetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text('overview',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
        Text('${moviedetails.overview}',style: const TextStyle(color: kgreycolor,fontSize: 14,fontWeight: FontWeight.w400),),
  SizedBox(height: 5),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Column(
      
      children: [
        const Text('number Of Episodes',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold ),),
        Text('${moviedetails.numberOfEpisodes}',style: const TextStyle(color: kgreycolor,fontSize: 14,fontWeight: FontWeight.w500),),
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
        const Text(' number Of Seasons',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
        Text('${moviedetails.numberOfSeasons}',style: const TextStyle(color: kgreycolor,fontSize: 14,fontWeight: FontWeight.w500),),
      ],
    ),
   const SizedBox()
,    Column(
      children: [
        const Text(' number Of Votes',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
        Text('${moviedetails.voteCount}',style: const TextStyle(color: kgreycolor,fontSize: 14,fontWeight: FontWeight.w500),),
      ],
    ),
  ],),
      ],
    );
  }
}