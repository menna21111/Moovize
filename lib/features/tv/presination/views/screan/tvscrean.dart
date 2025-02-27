import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../bloc/casttv_bloc.dart';
import '../../bloc/nowontv_bloc.dart';
import '../widgets/categriesmainpage.dart';
import '../widgets/ontv.dart';


class Tvscrean extends StatelessWidget {
  const Tvscrean({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NowontvBloc>().add(NowontvvEvent());
    context.read<CasttvBloc>().add(GetCasttv());
    Screan_size.init(context);
    return Scaffold(
      appBar: AppBar(
       
        actions: [
          Title(color: kblackcolor, child: Image.asset('assets/images/logo (2).png')),
        ],
        title: const Text(
          'tv',
          style: TextStyle(
             fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const CategoriesGrid(),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'on the air ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                    
                        ),
                      ),
                      Text(
                        '🔴',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                      
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'see more',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: khomecolor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:
                SizedBox(height: Screan_size.hieght * 0.3, child: const Ontv()),
          )
        ],
      ),
    );
  }
}
