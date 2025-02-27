import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../../../rating/presination/bloc/addrating_bloc.dart';
import '../../../data/models/moviemodels/moviedetails.dart';

class Filminfodata extends StatefulWidget {
  const Filminfodata({super.key, required this.movie});
  final MovieDetails movie;

  @override
  _FilminfodataState createState() => _FilminfodataState();
}

class _FilminfodataState extends State<Filminfodata> {
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // BlocConsumer<AddratingBloc, AddratingState>(
        //   listener: (context, state) {
        //        if (state is Addratingscuess) {
            
            
        //     }
        //   },
        //   builder: (context, state) {
         
        //     return Container();
        //   },
        // ),
        // Your existing code...
        SizedBox(
          width: Screan_size.width * .5,
          child: Text(
            widget.movie.title ?? 'movie',
            style: TextStyle(
              fontSize: 20,
              color: kwhitecolor,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            const Icon(
              Icons.visibility_outlined,
              color: kwhitecolor,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              '${widget.movie.popularity}',
              style: const TextStyle(
                fontSize: 13,
                color: kwhitecolor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        widget.movie.adult
            ? const Text(
                '18+',
                style: TextStyle(
                  fontSize: 13,
                  color: kwhitecolor,
                ),
              )
            : Container(),
        const SizedBox(height: 5),
        Text(
          '${widget.movie.runtime} min',
          style: const TextStyle(
            fontSize: 13,
            color: kwhitecolor,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              EvaIcons.star,
              color: Colors.yellow,
            ),
            Text(
              ' ${widget.movie.voteAverage.toString()}',
              style: const TextStyle(color: kwhitecolor),
            ),
            SizedBox(width: Screan_size.width * .09),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showBottomSheet(
                      backgroundColor: kblackcolor,
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: Screan_size.hieght * .5,
                          child: Column(children: [
                            SizedBox(height: Screan_size.hieght * .04),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: const Text(
                                    'close',
                                    style: TextStyle(
                                        color: khhomecolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Text(
                                  'Rating',
                                  style: TextStyle(
                                      color: khhomecolor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.read<AddratingBloc>().add(
                                          AddRate(
                                              widget.movie.id ?? 278, _rating),
                                        );
     ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: khhomecolor,
                                        content: Text(
                                          'Success! your rating updated to $_rating',
                                          style: const TextStyle(
                                              color: kwhitecolor),
                                        ),
                                      ),
                                    );
                                 

                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'save',
                                    style: TextStyle(
                                        color: khhomecolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: Screan_size.hieght * .09),
                            RatingBar.builder(
                              itemPadding: EdgeInsets.all(5),
                              itemSize: 50,
                              initialRating: _rating,
                              maxRating: 5,
                              glowColor: Colors.yellow,
                              unratedColor: kgreycolor,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return const Icon(
                                  EvaIcons.star,
                                  color: Colors.yellow,
                                );
                              },
                              onRatingUpdate: (rating) {
                                setState(() {
                                  _rating = rating;
                                });
                              },
                            ),
                          ]),
                        );
                      },
                    );
                  },
                  child: const Text(
                    'rate Now',
                    style: TextStyle(
                      color: Colors.yellow,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: Screan_size.hieght * .01),
      ],
    );
  }
}
