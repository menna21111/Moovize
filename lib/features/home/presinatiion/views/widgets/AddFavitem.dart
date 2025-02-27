import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovize/features/home/data/models/moviemodels/moviedetails.dart';
import '../../../../fav/presination/bloc/adddeletefav/bloc/adddeletfav_bloc.dart';
import '../../../../fav/presination/bloc/get/fav_bloc.dart';
import '../../../data/models/movie_responsemodel.dart';

class AddFavitem extends StatelessWidget {
  const AddFavitem({super.key, required this.isfav, required this.id});
  final bool isfav;
  final Movie id;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdddeletfavBloc, AdddeletfavState>(
      builder: (context, state) {
        bool isFavorite = isfav; 

        if (state is Adddeletsucess) {
          isFavorite = state.movies.any((element) => element.id == id.id);
        }

        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
            size: 40,
            color: isFavorite ? Colors.red : Colors.pink,
          ),
          onPressed: () {
            if (isFavorite) {
              context.read<AdddeletfavBloc>().add(DeletefavEventAdd(id));
                context.read<FavBloc>().add(GetFavEvent());
            } else {
              context.read<AdddeletfavBloc>().add(AddfavEventAdd(id));
                context.read<FavBloc>().add(GetFavEvent());
            }
          },
        );
      },
    );
  }
}
