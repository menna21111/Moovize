import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../../../../core/widgets/cachedimage.dart';
import '../../../../../core/widgets/loadingshimmer.dart';
import '../../bloc/movie/similarmovie/bloc/similiar_bloc.dart';
import '../screan/filmscreanbody.dart';



class Similarmovie extends StatelessWidget {
  const Similarmovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimiliarBloc, SimiliarState>(builder: (context, state) {
      if (state is MovieSIMILARSUCCESS) {
        if (state.data.results.isEmpty) {
          return const Center(
            child: Text('No similar movie data found.',
                style: TextStyle(color: kwhitecolor)),
          );
        } else {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.data.results.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Filmscreanbody(
                                  id: state.data.results[index].id ?? 278,movie: state.data.results[index],)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Screan_size.hieght * .22,
                          width: Screan_size.width * .5,
                          decoration: BoxDecoration(
                            color: kgreycolor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Cachedimage(
                              imageUrl:
                                  state.data.results[index].posterPath ?? '',
                              height: .3,
                              width: .5,
                              borderraduis: .05),
                        ),
                        Text(
                          (state.data.results[index].title ?? '')
                              .split(' ')
                              .take(3)
                              .join(' '),
                     
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
      } else if (state is MovieSIMILARFALIURE) {
        return SizedBox(
          child: Center(
            child: Text(state.failure.errMessage),
          ),
        );
      } else {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ShimmerLoading(
                width: Screan_size.width * .1,
                borderraduis: Screan_size.width * .00001,
              ),
            );
          },
        );
      }
    });
  }
}
