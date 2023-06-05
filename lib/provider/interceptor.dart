import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/app_setting.dart';

class Interceptor {
  final Dio api = Dio();
  Map<String, String> header = {};
  final apiEndpoint = '';
  String accessToken = '';
  BuildContext context;

  Interceptor(this.context){
    api.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      Provider.of<AppSettings>(context , listen: false).setLoadingNotifier(true);
      initState();
      if (!options.path.contains('http')) {
        options.path = apiEndpoint + options.path;
      }
      options.headers = header;
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      handleError(error.response , context);
    }));
  }

  Future<void> handleError(Response? res , context) async{
    Provider.of<AppSettings>(context , listen: false).setLoadingNotifier(false);
    Provider.of<AppSettings>(context , listen: false).setErrorNotifier(true);
    const snackBar = SnackBar(
      content: Text('Error!'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  void initState(){
    header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }

  void setLoadingNotifier(context){
    Provider.of<AppSettings>(context , listen: false).setLoadingNotifier(false);
  }

  Future<dynamic> get(route) async {
    final response = await api.get(route);
    if(response.statusCode ==200){
      setLoadingNotifier(context);
    }
    return response.data;
  }

  Future<dynamic> getWithQueryParameters(route , queryParameters) async {
    final response = await api.get(route , queryParameters: queryParameters);
    if(response.statusCode ==200){
      setLoadingNotifier(context);
    }
    return response.data;
  }

  Future<dynamic> post(route , data) async {
    final response = await api.post(route , data: jsonEncode(data));
    if(response.statusCode ==200){
      setLoadingNotifier(context);
    }
    return response;
  }

  Future<dynamic> postWithMultiPart(route , data) async {
    final response = await api.post(route , data: data);
    if(response.statusCode ==200){
      setLoadingNotifier(context);
    }
    return response;
  }


  Future<dynamic> put(route , data) async{
    final response = await api.put(route , data: jsonEncode(data));
    if(response.statusCode ==200){
      setLoadingNotifier(context);
    }
    return response;
  }

  Future<dynamic> putWithMultiPart(route , data) async{
    final response = await api.put(route , data: data);
    if(response.statusCode ==200){
      setLoadingNotifier(context);
    }
    return response;
  }

  Future<dynamic> delete(route) async{
    final response = await api.delete(route);
    if(response.statusCode ==200){
      setLoadingNotifier(context);
    }
    return response;
  }
}