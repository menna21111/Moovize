import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/Url.dart';
import '../../../../core/helper/apiservice.dart';

import '../../../../core/helper/failure.dart';
import '../models/movie_responsemodel.dart';


class Homerepo {
  final Apiservice apiservice;

  Homerepo(this.apiservice);

   Future<Either<Failure, MovieResponse>> getpopular() async {
    try {
      final response = await apiservice.get(
        endpoint: 'movie/popular',
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

   Future<Either<Failure, MovieResponse>> gettoprated() async {
    try {
      final response = await apiservice.get(
        endpoint: 'movie/top_rated',
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
   Future<Either<Failure, MovieResponse>> getupcoming() async {
    try {
      final response = await apiservice.get(
        endpoint: 'movie/upcoming',
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
  }
