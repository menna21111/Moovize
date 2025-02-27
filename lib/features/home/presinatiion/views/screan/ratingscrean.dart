// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../core/constants/colors.dart';
// import '../../../../../core/widgets/loadingshimmer.dart';
// import '../../../../rating/presination/bloc/getrating_bloc.dart';
// import 'filmscreanbody.dart';



// class Ratingscrean extends StatefulWidget {
//   const Ratingscrean({super.key});

//   @override
//   State<Ratingscrean> createState() => _RatingscreanState();
// }

// class _RatingscreanState extends State<Ratingscrean> {
//   @override
//   void initState() {
//    context .read<GetratingBloc>().add(Getrate());
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
  
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kblackcolor,
//         title: const Text(
//           'my rating',
//           style: TextStyle(color: khomecolor, fontSize: 25,fontWeight: FontWeight.bold ),
//         ),
//         actions: [
//           Title(color: kblackcolor, child: Image.asset('assets/logo.png')),
//         ],
//       ),
//       body: BlocBuilder<GetratingBloc, GetratingState>(builder: (context, state) {
//         if (state is Getratingscuess) {
//           if (state.getrate.results!.isEmpty) {
//             return const Center(
//               child: Text(
//                 'No Favourites yet',
//                 style: TextStyle(color: kwhitecolor),
//               ),
//             );
//           } else {
//             return ListView.builder(
//               itemCount: state.getrate.results!.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: GestureDetector(
//                     onTap: () {

//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Filmscreanbody(id:state.getrate.results![index].id ?? 278 ,)));
//                     },
//                     child: CustomMovieItem(
//                       movie: state.getrate.results![index],
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         } else if (state is Getratingfailure) {
//           return Center(
//             child: Text(
//               state.err.errMessage,
//               style: TextStyle(color: kwhitecolor),
//             ),
//           );
//         } else {
//           return ShimmerLoading(width: 1, borderraduis: 0, height: 1);
//         }
//       }),
//     );;
//   }
// }