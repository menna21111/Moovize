import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../../../../core/widgets/cachedimage.dart';
import '../../../../../core/widgets/imob.dart';
import '../../../../../core/widgets/loadingshimmer.dart';
import '../../bloc/nowontv_bloc.dart';
import 'tvdaetails.dart';

class Ontv extends StatelessWidget {
  const Ontv({super.key});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return BlocBuilder<NowontvBloc, NowontvState>(builder: (context, state) {
      if (state is Nowontvscucess) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return  Tvdaetails( tvid:  state.nowontv.results![index].id??278,);
                    }));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Screan_size.hieght * .19,
                      
                      decoration: BoxDecoration(
                      
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Cachedimage(
                          imageUrl: state.nowontv.results![index].backdropPath ?? '',
                          height: 0,
                          width: 0,
                          borderraduis: 0.04),
                    ),
                    Text(
                      state.nowontv.results![index].name ?? 'moviiename',
                      style: TextStyle(color: kwhitecolor),
                    ),
                    Row(
                      children: [
                        Imob(),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          state.nowontv.results![index].voteAverage.toString(),
                          style: TextStyle(color: kwhitecolor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      } else if (state is Nowontvfailure) {
        return Center(child: Text(state.failure.errMessage));
      } else {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerLoading(width: .5, borderraduis: .07,height: .14,),
                  ShimmerLoading(width: .04, borderraduis: .07,height: .01,),
                  ShimmerLoading(width: .04, borderraduis: .07,height: .01,)
                 
                
                
                    ],
                  )
                );
              }
            );
          }
        
      }
    );
  }
}
