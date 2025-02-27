import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/size.dart';
import '../../bloc/searchbloc_bloc.dart';
import '../widgets/SEARCDELEGTE.dart';
import '../widgets/gridsearch.dart';



class Searchscrean extends StatelessWidget {
  const Searchscrean({super.key});

  @override
  Widget build(BuildContext context) {
    Screan_size.init(context);
    return  Scaffold(
        appBar: AppBar(
        backgroundColor: kblackcolor,
        title: const Text(
          'search',
          style: TextStyle(color: khomecolor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          Title(color: kblackcolor, child: Image.asset('assets/images/logo (2).png')),
        ],
      ),body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  8.0),
        child: Column(
        
          children: [
            SizedBox(
              height: Screan_size.hieght * 0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: Screan_size.width * 0.05,),
                    Container(
                        height: Screan_size.hieght * 0.07,
                        width: Screan_size.width * 0.82,
                        child: TextFormField(
                          readOnly: true,
                          onTap: () {
                            showSearch(
                              context: context,
                              delegate: SearchDelegateCustom(context.read<SearchblocBloc>()),
                            );
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 24,
                              color: khomecolor,
                            ),
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
                            hintText: 'search',
                            fillColor: kblackcolor,
                            labelStyle:
                                const TextStyle(fontSize: 18, color: Colors.black),
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kgreycolor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 182, 161, 161),
                              ),
                            ),
                          ),
                        ),
                      ),
                     
                      
                  ],
                ), SizedBox(
                        height: Screan_size.hieght * 0.04,),
                        const Padding(
                          padding: EdgeInsets.only(left:  15.0,bottom: 15),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('TOP search',style: TextStyle(color: kwhitecolor,fontSize: 16,fontWeight: FontWeight.bold),)),
                        ),
                        Expanded(child: Gridsearch())
          ],
        ),
      ),
    );
  }
}