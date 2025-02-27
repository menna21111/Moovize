import 'dart:convert';
import 'dart:developer';

import '../../../../core/helper/cachhelper.dart';
import '../../../../core/helper/failure.dart';
import '../../../home/data/models/movie_responsemodel.dart';
import '../../../home/data/models/moviemodels/moviedetails.dart';

class FavRepoImpl {
  final CacheHelper cachehelper;

  FavRepoImpl({required this.cachehelper});

  /// Adds an item to favorites
  Future<List<Movie>> additemtofavorites(Movie item) async {
    try {
      final favoritesJson = cachehelper.getData(key: 'favoritess');

      List<Movie> favorites = [];

      if (favoritesJson != null) {
        final decoded = json.decode(favoritesJson);

        if (decoded is List) {
          favorites = decoded
              .map((e) => Movie.fromJson(Map<String, dynamic>.from(e)))
              .toList();
        } else {
          log('Warning: favoritesJson is not a valid List format');
          throw ServerFailure('Invalid data format in favorites');
        }
      }

      // Add the new item only if it doesn't exist
      if (!favorites.any((fav) => fav.id == item.id)) {
        favorites.add(item);

        // Save the updated list
        await cachehelper.saveData(
          key: 'favoritess',
          value: json.encode(favorites.map((fav) => fav.toJson()).toList()),
        );
      }

      return favorites;
    } catch (e) {
      throw ServerFailure('Failed to add item to favorites: $e');
    }
  }

  /// Deletes an item from favorites
  Future<List<Movie>> deleteitemfromfavorites(Movie item) async {
    try {
      final favoritesJson = cachehelper.getData(key: 'favoritess');

      List<Movie> favorites = [];

      if (favoritesJson != null) {
        final decoded = json.decode(favoritesJson);

        if (decoded is List) {
          favorites = decoded
              .map((e) => Movie.fromJson(Map<String, dynamic>.from(e)))
              .toList();
        } else {
          log('Warning: favoritesJson is not a valid List format');
          throw ServerFailure('Invalid data format in favorites');
        }
      }

      // Remove the item from the list
      favorites.removeWhere((fav) => fav.id == item.id);

      // Save the updated list
      await cachehelper.saveData(
        key: 'favoritess',
        value: json.encode(favorites.map((fav) => fav.toJson()).toList()),
      );

      return favorites;
    } catch (e) {
      throw ServerFailure('Failed to delete item from favorites: $e');
    }
  }

  /// Retrieves the list of favorite movies
 Future<List<Movie>> getfavorites() async {
  try {
    final favjson = cachehelper.getData(key: 'favoritess');

    List<Movie> fav = [];

    if (favjson != null) {
      final decodedData = json.decode(favjson);

      log('Decoded JSON: $decodedData'); // Debugging

      if (decodedData is List) {
        log('$decodedData');
        fav = (json.decode(favjson)as List).map<Movie>((e) {
          if (e is Map<String, dynamic>) {
            log('Valid data format in favorites');
            return Movie.fromJson(e);
          } else {
            log('Warning: Invalid data format in favorites');
            throw ServerFailure('Invalid data format in favorites');
          }
        }).toList();
      } else {
        log('Warning: Favorites data is not a List');
        throw ServerFailure('Favorites data is not a List');
      }
    }
    log('$fav');
    return fav;
  } catch (e) {
    log('Error in getfavorites: $e');
    throw ServerFailure('Failed to get favorites: $e');
  }
}
}
