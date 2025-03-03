import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../../../../core/widgets/loadingshimmer.dart';
import '../../../../home/presinatiion/views/widgets/cast.dart';
import '../../../../home/presinatiion/views/widgets/similarmovie.dart';
import '../../bloc/detailstv_bloc.dart';
import 'overviewtv.dart';
import 'photopostertv.dart';



class Tvdaetails extends StatelessWidget {
  const Tvdaetails({super.key, required this.tvid});
  final int tvid;

  @override
  Widget build(BuildContext context) {
    context.read<DetailstvBloc>().add(TvGETDetail( tvid));
    Screan_size.init(context);
    return Scaffold(
      body:
          BlocBuilder<DetailstvBloc, DetailstvState>(builder: (context, state) {
        if (state is TvDetailsSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Posterphotoandinfo(
                  movie: state.data,
                ),
                SizedBox(
                  height: Screan_size.hieght * .04,
                ),
             
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Overviewtv(
                      moviedetails: state.data,
                    )),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Cast',
                      style: TextStyle(
                      
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      SizedBox(height: Screan_size.hieght * .3, child: Cast()),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'similar shows',
                      style: TextStyle(
                     
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: Screan_size.hieght * .3, child: Similarmovie()),
                )
              
              ],
            ),
          );
        } else if (state is TvDetailsFailure) {
          return Center(
            child: Text(
              state.failure.errMessage,
           
            ),
          );
        } else {
          return ShimmerLoading(
            width: 1,
            borderraduis: 0,
            height: 1,
          );
        }
      }),
    );
  }
}
