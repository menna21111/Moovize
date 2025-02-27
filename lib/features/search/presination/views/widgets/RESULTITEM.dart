import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovize/features/home/data/models/movie_responsemodel.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../../../home/presinatiion/bloc/movie/detailsmoviebloc/moviebloc_bloc.dart';
import '../../../../home/presinatiion/views/screan/filmscreanbody.dart';
import '../../../data/model/searchmodel.dart';

class Resultitem extends StatelessWidget {
  const Resultitem({super.key, required this.data});
  final Searchmodel data;

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return GestureDetector(

      onTap: () {
        context.read<MovieblocBloc>().add(MovIEGETDetail(data.id??278));
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return  Filmscreanbody(id:data.id??278 ,movie:Movie(adult: false,genreIds: [1,2],popularity: 20,video: true,voteAverage: 444,) ,);
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        // height: Screan_size.hieght * 0.08,
        child:  Row(
          
          children: [
            CircleAvatar(
              backgroundColor: kgreycolor,
               radius: Screan_size.width * 0.07,
        backgroundImage: NetworkImage(
  'https://image.tmdb.org/t/p/w780${data.posterPath??'https://image.tmdb.org/t/p/w780/aKCxzcNr8bUiJCwrrc0y9rYFfbU.jpg'}',
  
      
),)
           ,SizedBox(width: Screan_size.width * 0.1,), Text((data.title??'').split(' ').take(2).join(' '), style: TextStyle(color: kwhitecolor),),
          ],
        ),
      ),
    );
  }
}
