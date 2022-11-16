import 'package:http/http.dart' as http;

import '../Provider/Api_Client.dart';

const baseUrl = 'https://api.github.com/';
final ApiClient repository = ApiClient(
  httpClient: http.Client(),
);
const String token = "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";

String userDetails = "user";
String allRepos = "users/";
String singlerepoDetailsandBranches = "repos/";

const apiheader = {
  'Accept': 'application/vnd.github+json',
  'Authorization': 'Bearer $token'
};
