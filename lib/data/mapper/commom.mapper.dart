import '../dto/common/response_wrapper/response_wrapper.dart';

extension ResponseWrapperX on ResponseWrapper{
  ResponseWrapper<T> toModle<T>(T data){
    return ResponseWrapper<T>(status: status, code: code, message:message, data:data);
  }
}