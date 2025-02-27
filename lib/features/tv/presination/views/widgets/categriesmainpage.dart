import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../core/constants/size.dart';
import '../../../../../core/widgets/cachedimage.dart';
import '../../../../../core/widgets/loadingshimmer.dart';
import '../../bloc/casttv_bloc.dart';
import 'tvdaetails.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return BlocBuilder<CasttvBloc, CasttvState>(builder: (context, state) {
      if (state is TVCastSuccess) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          sliver: SliverMasonryGrid(
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == 1) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Tvdaetails(tvid:state.data.results![1].id??278 ,)));
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: Screan_size.hieght * 0.29,
                          decoration: BoxDecoration(
                           
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Cachedimage(imageUrl: state.data.results![1].backdropPath??'', height: 0, width: 0, borderraduis: 0)
                        ),

                        Text(state.data.results![1].name??'')
                      ],
                    ),
                  );
                }

                return GestureDetector(
                   onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Tvdaetails(tvid:state.data.results![1].id??278 ,)));
                    },
                  child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: Screan_size.hieght * 0.2,
                            decoration: BoxDecoration(
                             
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Cachedimage(imageUrl: state.data.results![index].backdropPath??'', height: 0, width: 0, borderraduis: 0)
                          ),
                  
                          Text(state.data.results![index].name??'')
                        ],
                      ),
                );
              },
              childCount: 5,
            ),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
        );
      }else if(state is TvCastFailure){

        return Center(
          child: Text(state.failure.errMessage),
        );

        
      }else{
           return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          sliver: SliverMasonryGrid(
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
           
                  return ShimmerLoading(
                    height: .2,
                   borderraduis: .02,
                   width: 0,
                  
                  );
                

              
              },
              childCount: 5,
            ),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
        );
      }
    });
  }
}
