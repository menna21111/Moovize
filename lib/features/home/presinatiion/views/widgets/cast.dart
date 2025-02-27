import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../../../../core/widgets/cachedimage.dart';
import '../../../../../core/widgets/loadingshimmer.dart';
import '../../bloc/movie/cast/bloc/cast_bloc.dart';


class Cast extends StatelessWidget {
  const Cast({super.key});

  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<CastBloc, CastState>(builder: (context, state) {
      if (state is MovieCastSuccess) {
        if (state.data.cast.isEmpty) {
          return const Center(
            child: Text('No cast data found.',
                style: TextStyle(color: kwhitecolor)),
          );
        }
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.data.cast.take(10).length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Screan_size.hieght * .22,
                      width: Screan_size.width * .3,
                      decoration: BoxDecoration(
                        color: kgreycolor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Cachedimage(
                          imageUrl:
                              state.data.cast[index].profilePath ?? '',
                          height: .3,
                          width: .3,
                          borderraduis: .05),
                    ),
                    Text(
                      state.data.cast[index].name ?? '',
                      style: TextStyle(color: kwhitecolor),
                    ),
                    
                  ],
                ),
              );
            });
      } else if (state is MovieCastFailure) {
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