import 'dart:convert';

List<AllBranches> allBranchesFromJson(String str) => List<AllBranches>.from(
    json.decode(str).map((x) => AllBranches.fromJson(x)));

String allBranchesToJson(List<AllBranches> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllBranches {
  AllBranches({
    this.name,
    this.commit,
  });

  String? name;
  Commit? commit;

  factory AllBranches.fromJson(Map<String, dynamic> json) => AllBranches(
        name: json["name"],
        commit: Commit.fromJson(json["commit"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "commit": commit?.toJson(),
      };
}

class Commit {
  Commit({
    this.sha,
    this.url,
  });

  String? sha;
  String? url;

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        sha: json["sha"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
      };
}
