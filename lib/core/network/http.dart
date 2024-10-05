import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:test/core/local_storage/cache_service.dart';

import '../local_storage/local_storage.dart';
import '../network/dio.dart';

import "../errors/custom_exception.dart";

enum RequestMethod { get, post, delete, put, patch }

extension RequestTypeString on RequestMethod {
  String? get methodString {
    switch (this) {
      case RequestMethod.get:
        return 'GET';
      case RequestMethod.post:
        return 'POST';
      case RequestMethod.delete:
        return 'DELETE';
      case RequestMethod.put:
        return 'PUT';
      case RequestMethod.patch:
        return 'PATCH';
    }
  }
}

class Request {
  final String endPoint;
  final bool authorized;
  final bool isFormData;
  final bool removeMockMatch;
  final bool cacheable;
  final RequestMethod method;
  Map<String, dynamic>? headers;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? queryParams;

  Request(
    this.endPoint,
    this.method, {
    this.authorized = false,
    this.removeMockMatch = false,
    this.isFormData = false,
    this.headers ,
    this.cacheable = false,
    this.body,
    this.queryParams,
  }) {
      headers?.putIfAbsent("Accept" ,(){
        "application/json";
      });
    if (authorized) {
      LocalStorage localStorage = LocalStorage();
      log('my toooken : ${localStorage.getToken()}');
      if (headers == null) {
        headers = {
          "Authorization": "Bearer " '${localStorage.getToken()}',
          
        };
      } else {
        headers!['Authorization'] = "Bearer " '${localStorage.getToken()}';
      }
    }

    if (isFormData) {
      log('im form data');
      FormData f = FormData.fromMap(body!);
      for (var pair in f.fields) {
        log('${pair.key}/${pair.value}');
      }
    }
  }

  Future<Map<String, dynamic>> sendRequest(
      {void Function(Object)? onConnectionError}) async {
    Response? response;
    try {
      response = await DioInstance().dio.request(
            endPoint,
            queryParameters: queryParams,
            data: isFormData ? FormData.fromMap(body!) : body,
            options: Options(
              method: method.methodString, 
              headers: headers,
              
            ),
          );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (response.data is String) return json.decode(response.data);
         if (method == RequestMethod.get && cacheable) {
          await CacheService.cacheRequest(
              request: toString(), lastResponse: response.data);
        }
       

        return response.data;
      }
    } on DioException catch (error) {
      if (error.type == DioExceptionType.badResponse) {
        // handling bad requests.
        if (error.response!.statusCode == 400) {
          // this line is really depends on what server responds, and how it reply with errors.
          throw badRequestException[error.response!.data["error"]["name"]] ??
              GenericException(
                type: ExceptionType.Other,
              );
        }
      

        // handling other status codes.
        throw statusCodesException[error.response!.statusCode] ??
            GenericException(
              type: ExceptionType.Other,
            );
      }

      if (error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout ||
          error.type == DioExceptionType.unknown) {
            if (method == RequestMethod.get && cacheable) {
          onConnectionError?.call(error);
          Map<String, dynamic>? lastResponse =
              await CacheService.getRequest(request: toString());
          if (lastResponse != null) {
            return lastResponse;
          }
        }
      
        throw GenericException(
          type: ExceptionType.ConnectionError,
          errorMessage: "You Have no Internet Connection",
        );
      }
    }
    return {};
  }
   Map<String, dynamic> toJson() {
    return {
      'endPoint': endPoint,
      'authorized': authorized,
      'isFormData': isFormData,
      'removeMockMatch': removeMockMatch,
      'headers': headers,
      'body': body,
      'queryParams': queryParams,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }

}
