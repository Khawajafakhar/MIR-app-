import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../app_urls.dart';
import './api_models.dart';
import '../../../models/error_model.dart';
import '../../../ui/util/toast/toast.dart';
import './dio_exceptions.dart';
import '../../../constants/app_constants.dart';

class ApiService {
  //Post Api
  static Future<dynamic> callPostApi({
    required String url,
    dynamic modelName,
    dynamic body,
    Map<String, dynamic>? params,
    Map<String, dynamic>? header,
  }) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: ApiUrls.baseUrl,
        contentType: 'application/json',
        headers: {},
      );
      Dio dio = Dio(options);
      Response response = await dio.post(
        url,
        data: body,
        options: Options(headers: header),
        queryParameters: params,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var modelObject = ApiModels.getModelObject(
          modelName: modelName,
          json: response.data,
        );
        return modelObject;
      }
    } on DioError catch (er) {
      if (er.response != null) {
        Error errorResponse = ApiModels.getModelObject(
          modelName: ApiModels.errorModel,
          json: er.response!.data,
        );
        ToastMessage.show(errorResponse.error, TOAST_TYPE.error);
        return null;
      } else {
        DioExceptions.fromDioException(er);
        return null;
      }
    } on Exception {
      ToastMessage.show(AppConstants.textUndefinedError, TOAST_TYPE.error);
      return null;
    } catch (er) {
      debugPrint(er.toString());
      return null;
    }
  }

  // Put Api
  static Future<dynamic> callPutApi({
    required String url,
    required String modelName,
    dynamic body,
    Map<String, dynamic>? header,
    Map<String, dynamic>? params,
  }) async {
    try {
      BaseOptions options = BaseOptions(
          baseUrl: ApiUrls.baseUrl,
          contentType: 'application/json,',
          headers: {});
      Dio dio = Dio(options);
      Response response = await dio.put(
        url,
        queryParameters: params,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var modelObject = ApiModels.getModelObject(
          modelName: modelName,
          json: response.data,
        );
        return modelObject;
      }
    } on DioError catch (er) {
      if (er.response != null) {
        Error errorResponse = ApiModels.getModelObject(
            modelName: ApiModels.errorModel, json: er.response!.data);
        ToastMessage.show(errorResponse.error, TOAST_TYPE.error);
        return null;
      }else{
        DioExceptions.fromDioException(er);
        return null;
      }
    }on Exception {
      ToastMessage.show(AppConstants.textUndefinedError, TOAST_TYPE.error);
      return null;
    }catch(er){
      debugPrint(er.toString());
      return null;
    }
  }
}
