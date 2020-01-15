import 'dart:convert';

import 'package:flutter_todo_redux_clone/entities/data_entity.dart';
import 'package:flutter_todo_redux_clone/models/task.dart';
import 'package:http/http.dart' as http;

import 'api_provider.dart';


class LocalApiProvider extends ApiProvider {
    static const String SERVER_URI = "http://my-json-server.typicode.com/caothang1183/apitaskstest/db";

//    static const String TOKEN = "token";
//    static const String ACCOUNT_NAME = "auth0";
//    @override
//    Map<String, String> headers = {
//        "x-access-token": TOKEN,
//        "acc_name": ACCOUNT_NAME,
//    };

    @override
    String host = SERVER_URI;

    @override
    fetchTasks<T>(dynamic criteria) {
        return http.get('$host',
            headers: headers)
            .then((resp) {
            return DataEntity.fromJson(jsonDecode(resp.body)) as T;
        });
    }
}
