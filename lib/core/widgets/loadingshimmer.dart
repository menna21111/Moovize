import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import '../constants/size.dart';

class ShimmerLoading extends StatelessWidget {
   ShimmerLoading({Key? key,  this.height,required  this.width,required  this.borderraduis});
   num? height;
   num width;
   num borderraduis;

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return Shimmer.fromColors(
      baseColor: Colors.grey[900]!,
      highlightColor: Colors.grey[700]!,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        width: Screan_size.width * width,
        height: Screan_size.hieght *(height??0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(Screan_size.width * borderraduis,),
        ),
      ),
    );
  }
}
