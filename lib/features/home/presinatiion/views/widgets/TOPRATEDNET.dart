import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../../../../core/widgets/cachedimage.dart';
import '../../../../../core/widgets/imob.dart';
import '../../../../../core/widgets/loadingshimmer.dart';
import '../../bloc/topratedbloc/bloc/toprated_bloc.dart';
import '../screan/filmscreanbody.dart';


class Upcomov extends StatelessWidget {
  const Upcomov({super.key});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return BlocBuilder<TopratedBloc, TopratedState>(builder: (context, state) {
      if (state is Scucesstoprated) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return  Filmscreanbody( id:  state.top.results[index].id??278,movie: state.top.results[index],);
                    }));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Screan_size.hieght * .22,
                        width: Screan_size.width * .5,
                        decoration: BoxDecoration(
                          color: kgreycolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Cachedimage(
                            imageUrl:
                                state.top.results[index].backdropPath ?? '',
                            height: .19,
                            width: .3,
                            borderraduis: .027),
                      ),
                      Text(
                        state.top.results[index].title ?? '',
                       
                      ),
                      Row(
                        children: [
                          Imob(),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            state.top.results[index].voteAverage.toString(),
                           
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      } else if (state is Failuretoprated) {
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
                borderraduis: Screan_size.width * .0002,
              ),
            );
          },
        );
      }
    });
  }
}
