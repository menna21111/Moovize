// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../core/constant/colors.dart';
// import '../../../../core/widgets/loadingshimmer.dart';
// import '../manager/bloc/getrating_bloc.dart';

// class Mtrating extends StatelessWidget {
//   const Mtrating({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //  context.read<GetratingBloc>().add(Getrate(movie.id??278));
//     return BlocBuilder<GetratingBloc, GetratingState>(
//       builder: (context, rstate) {
//         if (rstate is Getratingscuess) {
//           // Check if rated is not null and rated is not false
//           if (rstate.getrate) {
//             return ListTile(
//               leading: const CircleAvatar(
//                 radius: 30,
//                 backgroundImage: AssetImage('assets/avater (2).jpeg'),
//               ),
//               title: const Text(
//                 'Me',
//                 style: TextStyle(
//                   color: kwhitecolor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               subtitle: Row(
//                 children: [
//                   Text(''),
//                   const Icon(Icons.star, color: Colors.amber),
//                 ],
//               ),
//             );
//           } else {
//             // Handle the case where rated is false
//             return ListTile(
//               leading: const CircleAvatar(
//                 radius: 30,
//                 backgroundImage: AssetImage('assets/avater (2).jpeg'),
//               ),
//               title: const Text(
//                 'Me',
//                 style: TextStyle(
//                   color: kwhitecolor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               subtitle: const Text(
//                 'Not rated yet',
//                 style: TextStyle(color: Colors.grey),
//               ),
//             );
//           }
//         } else if (rstate is Getratingfailure) {
//           return Center(child: Text(rstate.err.errMessage));
//         } else  {
//           return ShimmerLoading(
//             width: .9,
//             borderraduis: 0,
//             height: .08,
//           );
//         }
//       },
//     );
//   }
// }
