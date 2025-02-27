import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


import '../../../../core/constants/Url.dart';
import '../../../../core/helper/apiservice.dart';
import '../../../../core/helper/failure.dart';
import '../model/searchmodel.dart';


class Searchrepo {
  final Apiservice apiservice;

  Searchrepo(this.apiservice);

   Future<Either<Failure, SearchmodelResponse>> searchfilm(String query) async {
    try {
      final response = await apiservice.search(
        endpoint: 'search/movie',
        name:'query=' ,
        query: query,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = SearchmodelResponse.fromJson(response);
    return right(data);
    } catch (e) {
 if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }

    }
   Future<Either<Failure, Searchmodel>> searchtv(String query) async {
    try {
      final response = await apiservice.search(
        endpoint: 'search/tv',
        query: query,
          name:'query=' ,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${URL.accessToken}',
            'Content-Type': 'application/json',
          },
        ),
      );
      final data = Searchmodel.fromJson(response);
    return right(data);
    } catch (e) {
 if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }

    }
 
  }

