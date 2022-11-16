import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Models/AllRepo.dart';
import '../Models/Branches.dart';
import '../Models/Usermodel.dart';
import '../Utils/String.dart';

enum Method { POST, GET, PUT, DELETE }

abstract class ServiceAPI {
  Future<UserDetails> userGitDetails();
  Future<List<AllRepos>> getAllRepos(username);
  Future<List<AllBranches>> getAllRepoBranches(username, repoName);
}

class ApiClient extends ServiceAPI {
  final http.Client httpClient;

  ApiClient({
    required this.httpClient,
  });

  Future<Map<String, dynamic>> callApi(Map<String, String> headers, String body,
      String apiname, Method method) async {
    // SmartDialog.showLoading();

    final url = baseUrl + apiname;
    debugPrint(method.name + " : " + url);
    debugPrint("HEADER : " + headers.toString());
    debugPrint("BODY : " + body);
    http.Response response;
    switch (method) {
      case Method.GET:
        response = await httpClient.get(Uri.parse(url), headers: headers);
        break;
      case Method.POST:
        response =
            await httpClient.post(Uri.parse(url), headers: headers, body: body);
        break;
      case Method.PUT:
        response =
            await httpClient.put(Uri.parse(url), headers: headers, body: body);
        break;
      case Method.DELETE:
        response = await httpClient.delete(Uri.parse(url),
            headers: headers, body: body);
        break;
    }
    print("RESPONSE : " + response.body);
    //  SmartDialog.dismiss();
    if (response.statusCode != 200) {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text("No data available")));
      // });
      // SmartDialog.showToast(response.body);

      try {
        throw Exception(json.decode(response.body));
      } catch (e) {
        throw Exception(json.decode(response.body));
      }
    }
    return jsonDecode(response.body);
  }

  @override
  Future<UserDetails> userGitDetails() async {
    var headers = apiheader;
    final body = json.encode({});
    return UserDetails.fromJson(
        await callApi(headers, body, userDetails, Method.GET));
  }

  @override
  Future<List<AllRepos>> getAllRepos(username) async {
    final all = <AllRepos>[];
    String url = baseUrl + allRepos + '${username}/repos';
    final body = json.encode({});
    final response = await http.get(Uri.parse(url), headers: apiheader);
    if (response.statusCode == 200) {
      log("RESPONSE : " + response.body);
      return await allReposFromJson(response.body);
    } else {
      return all;
    }
    // var headers = apiheader;
    // final body = json.encode({});
    // return AllRepos.fromJson(
    //     await callApi(headers, body, userDetails, Method.GET));
  }

  @override
  Future<List<AllBranches>> getAllRepoBranches(username, repoName) async {
    final all = <AllBranches>[];
    String url = baseUrl +
        singlerepoDetailsandBranches +
        '${username}/${repoName}/branches';
    final body = json.encode({});
    final response = await http.get(Uri.parse(url), headers: apiheader);
    if (response.statusCode == 200) {
      log("RESPONSE : " + response.body);
      return await allBranchesFromJson(response.body);
    } else {
      return all;
    }
  }
}
