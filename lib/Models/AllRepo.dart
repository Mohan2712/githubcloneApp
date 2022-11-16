import 'dart:convert';

List<AllRepos> allReposFromJson(String str) =>
    List<AllRepos>.from(json.decode(str).map((x) => AllRepos.fromJson(x)));

String allReposToJson(List<AllRepos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllRepos {
  AllRepos({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.createdAt,
    this.gitUrl,
    this.cloneUrl,
    this.archived,
    this.visibility,
    this.defaultBranch,
  });

  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  bool? private;
  String? htmlUrl;
  dynamic? description;
  bool? fork;
  String? url;
  String? forksUrl;
  String? keysUrl;
  String? collaboratorsUrl;
  String? teamsUrl;
  String? assigneesUrl;
  String? branchesUrl;
  String? commitsUrl;
  String? gitCommitsUrl;
  DateTime? createdAt;
  String? gitUrl;
  String? cloneUrl;
  int? size;
  bool? archived;
  String? visibility;
  String? defaultBranch;

  factory AllRepos.fromJson(Map<String, dynamic> json) => AllRepos(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        private: json["private"],
        htmlUrl: json["html_url"],
        description: json["description"],
        fork: json["fork"],
        url: json["url"],
        forksUrl: json["forks_url"],
        keysUrl: json["keys_url"],
        collaboratorsUrl: json["collaborators_url"],
        teamsUrl: json["teams_url"],
        assigneesUrl: json["assignees_url"],
        branchesUrl: json["branches_url"],
        commitsUrl: json["commits_url"],
        gitCommitsUrl: json["git_commits_url"],
        createdAt: DateTime.parse(json["created_at"]),
        gitUrl: json["git_url"],
        cloneUrl: json["clone_url"],
        archived: json["archived"],
        visibility: json["visibility"],
        defaultBranch: json["default_branch"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "name": name,
        "full_name": fullName,
        "private": private,
        "html_url": htmlUrl,
        "description": description,
        "fork": fork,
        "url": url,
        "forks_url": forksUrl,
        "keys_url": keysUrl,
        "collaborators_url": collaboratorsUrl,
        "teams_url": teamsUrl,
        "assignees_url": assigneesUrl,
        "branches_url": branchesUrl,
        "commits_url": commitsUrl,
        "git_commits_url": gitCommitsUrl,
        "git_url": gitUrl,
        "clone_url": cloneUrl,
        "size": size,
        "archived": archived,
        "visibility": visibility,
        "default_branch": defaultBranch,
      };
}
