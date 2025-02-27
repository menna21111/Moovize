import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../core/constants/size.dart';
import '../../../../../core/widgets/cachedimage.dart';
import '../../../../../core/widgets/imob.dart';
import '../../../../../core/widgets/loadingshimmer.dart';
import '../../../../home/presinatiion/bloc/popular/bloc/populars_bloc.dart';
import '../../../../home/presinatiion/views/screan/filmscreanbody.dart';

class Gridsearch extends StatelessWidget {
  const Gridsearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return BlocBuilder<PopularsBloc, PopularsState>(builder: (context, state) {
      if (state is Scucesspopular) {
        return GridView.builder(
         
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.5,
          ),
          itemCount: state.popular.results.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  Filmscreanbody( id: state.popular.results[index].id??278,movie: state.popular.results[index],)));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: Screan_size.width * .4,
                        height: Screan_size.hieght * .22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Cachedimage(
                            imageUrl: state.popular.results[index].backdropPath ?? '',
                            height: 0,
                            width: 0,
                            borderraduis: .0),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.popular.results[index].title ?? '',
                      style: const TextStyle(
                 
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Imob(),
                        SizedBox(width: 4),
                        Text(
                          state.popular.results[index].voteAverage.toString(),
                          style: const TextStyle(
                         
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else if (state is Failurepopular) {
        return SizedBox(
          height: Screan_size.hieght,
          width: Screan_size.width,
          child: Center(
            child: Text(
              state.failure.errMessage,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      } else {
        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.5,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ShimmerLoading(width: .4, borderraduis: .22, height: 0),
                  ),
                  const SizedBox(height: 8),
                  ShimmerLoading(width: .0, borderraduis: .02, height: .02),
                  ShimmerLoading(width: .08, borderraduis: .02, height: .02),
                ],
              ),
            );
          },
        );
      }
    });
  }
}
