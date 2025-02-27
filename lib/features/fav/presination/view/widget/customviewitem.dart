import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/size.dart';
import '../../../../../core/widgets/cachedimage.dart';


class CustomMovieItem extends StatelessWidget {
  final dynamic movie;

  const CustomMovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);

    return SizedBox(
      height: Screan_size.hieght*.3,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            child: Cachedimage(
              imageUrl: '${movie.backdropPath}',
              height: 1,
              width: 1,
              borderraduis: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
              left: 15,
            ),
            child: Text(
              movie.title?.toUpperCase() ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'muli',
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
