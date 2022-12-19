import 'package:dio/dio.dart';

import '../../../constants/app_constants.dart';
import '../../../ui/util/toast/toast.dart';

class DioExceptions implements Exception {
  late String message;
  DioExceptions.fromDioException(DioError dioErr) {
    switch (dioErr.type) {
      case DioErrorType.cancel:
        message = AppConstants.textCanceledRequest;
        showToast(message);
        break;
      case DioErrorType.connectTimeout:
        message = AppConstants.textRequestTimeOut;
        showToast(message);
        break;
      case DioErrorType.receiveTimeout:
        message = AppConstants.textRecievingTimeOut;
        showToast(message);
        break;
      case DioErrorType.sendTimeout:
        message = AppConstants.textSendingTimeOut;
        showToast(message);
        break;
      case DioErrorType.other:
        if (dioErr.message.contains("SocketException")) {
          message = AppConstants.textCheckNetwork;
          showToast(message);
        } else {
          message = AppConstants.textSendingTimeOut;
          showToast(message);
        }
        break;
      case DioErrorType.response:
        message = _handleError(
          dioErr.response!.statusCode,
          dioErr.message,
        );
        showToast(message);

        break;

      default:
        message = AppConstants.textUndefinedError;
        showToast(message);
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return AppConstants.textInvalidData;
      case 401:
        return AppConstants.textUnathorized;
      case 403:
        return AppConstants.textErrorForbiden;
      case 404:
        return error['message'];
      case 500:
        return AppConstants.textErrorInternelServer;
      case 502:
        return AppConstants.textErrorBadRequest;
      default:
        return AppConstants.textSomethingWentWrong;
    }
  }

  void showToast(String msg) {
    ToastMessage.show(
      msg,
      TOAST_TYPE.error,
    );
  }
}
