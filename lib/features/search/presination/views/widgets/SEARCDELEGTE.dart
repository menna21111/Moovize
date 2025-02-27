import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../core/constants/colors.dart';
import '../../../data/model/searchmodel.dart';

import '../../bloc/searchbloc_bloc.dart';
import 'RESULTITEM.dart';

class SearchDelegateCustom extends SearchDelegate<Searchmodel> {
  final SearchblocBloc searchbloc;

  SearchDelegateCustom(this.searchbloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
         Searchmodel data = Searchmodel(); 
        close(context,data );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchbloc.add(SearchblocEventSearchMOvie(query)); // Trigger search event

    return Scaffold(
     
      body: BlocBuilder<SearchblocBloc, SearchblocState>(
        bloc: searchbloc,
        builder: (context, state) {
          if (state is Searchmovieloading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Searchmoviesuccess) {
            if (state.data.results!.isEmpty) {
              return const Center(child: Text('No results found.'));
            } else {
              return ListView.builder(
                itemCount: state.data.results!.length,
                itemBuilder: (context, index) {
                  final result = state.data.results![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Resultitem(
                      data: result,
                    ),
                  );
                },
              );
            }
          } else if (state is Searchmoviefailure) {
            return Center(child: Text('Error: ${state.e.errMessage}'));
          } else {
            return const Center(child: Text('Start typing to search'));
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(child: Text('Start typing to search'));
    }

    searchbloc.add(SearchblocEventSearchMOvie(query)); // Trigger suggestions

    return Scaffold(
      
      body: BlocBuilder<SearchblocBloc, SearchblocState>(
        bloc: searchbloc,
        builder: (context, state) {
          if (state is Searchmovieloading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Searchmoviesuccess) {
            final suggestions = state.data.results!.where((data) {
              return data.title?.toLowerCase().contains(query.toLowerCase()) ?? false;
            }).toList();

            if (suggestions.isEmpty) {
              return const Center(child: Text('No suggestions found.'));
            }

            return ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                final suggestion = suggestions[index];
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: kgreycolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(suggestion.title ?? '',
                        style: const TextStyle(color: kwhitecolor)),
                    onTap: () {
                      query = suggestion.title ?? '';
                      showResults(context);
                    },
                  ),
                );
              },
            );
          } else if (state is Searchmoviefailure) {
            return Center(child: Text('Error: ${state.e.errMessage}'));
          } else {
            return const Center(child: Text('Start typing to search'));
          }
        },
      ),
    );
  }
}

