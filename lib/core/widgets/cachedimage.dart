import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/Url.dart';
import '../constants/size.dart';
import 'loadingshimmer.dart';

class Cachedimage extends StatelessWidget {
  const Cachedimage({super.key, required this.imageUrl, required this.height, required this.width, required this.borderraduis});
  final String imageUrl;
  final double height;
  final double width;
  final double borderraduis;

  @override
  

  Widget build(BuildContext context) {
    Screan_size.init(context);
    return ClipRRect(
          borderRadius: BorderRadius.circular(Screan_size.width *borderraduis),
      child: CachedNetworkImage(imageUrl:  '${URL.imageUrl}$imageUrl', fit: BoxFit.fill,fadeOutCurve: Curves.easeInBack, fadeInCurve: Curves.easeInBack,
                 placeholder: (context, url) => ShimmerLoading(height:Screan_size.hieght * height,width:Screan_size.width * width,borderraduis:Screan_size.width * borderraduis,),
                 errorWidget: (context, url, error) => Icon(Icons.error),
                 ),
    );
  }
}
