import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/Url.dart';
import '../../../../core/helper/apiservice.dart';

import '../../../../core/helper/failure.dart';
import '../models/addrate.dart';
import '../models/getrating.dart';

class Raterepo {
  final Apiservice apiservice;

  Raterepo(this.apiservice);
  Future<Either<Failure, AddRatingResponse>> addrating(
      int movieid, double ratenum) async {
    try {
      final response = await apiservice.post(
        endpoint: 'movie/$movieid/rating',
        data: {'value': ratenum},
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = AddRatingResponse.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

Future<Either<Failure, RatedMoviesResponse>> isRated() async {
  try {
    final response = await apiservice.getwsessionid(
      endpoint: 'account/21572946/rated/movies',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${URL.accessToken}',
          'Content-Type': 'application/json',
        },
      ),
    );

   
    final data = RatedMoviesResponse.fromJson(response);
    return right(data);

  } catch (e) {
    if (e is DioException) {
      return left(ServerFailure.fromDioError(e));
    }
    return left(ServerFailure(e.toString()));
  }
}


  Future<Either<Failure, AddRatingResponse>> deleterating(int movieid) async {
    try {
      final response = await apiservice.delete(
        endpoint: 'movie/$movieid/rating',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = AddRatingResponse.fromJson(response);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
