



import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/Url.dart';
import '../../../../core/helper/apiservice.dart';

import '../../../../core/helper/failure.dart';
import '../models/generesmodel.dart';
import '../models/movie_responsemodel.dart';


class Generrepo {
  final Apiservice apiservice;

  Generrepo(this.apiservice);

  Future<Either<Failure, GenreResponse>> getgenremovie() async {
    try {
      final response = await apiservice.get(
        endpoint: 'genre/movie/list',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response);
      final data = GenreResponse.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, GenreResponse>> getgenretv() async {
    try {
      final response = await apiservice.get(
        endpoint: 'genre/tv/list',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = GenreResponse.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MovieResponse>> getfilmsgener(int genrid) async {
    try {
      final response = await apiservice.search(
        endpoint: 'discover/tv',
        name: 'with_genres=',
        query: '$genrid',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = MovieResponse.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, MovieResponse>> getmoviegener(int genrid) async {
    try {
      final response = await apiservice.search(
        endpoint: 'discover/movie',
        name: 'with_genres=',
        query: '$genrid',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      log('ggggggg');
      print(response);
      final data = MovieResponse.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
