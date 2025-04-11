class UserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  String get fullName => '$firstName $lastName';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }
}

class PaginatedUsersResponse {
  final List<UserModel> users;
  final int total;
  final int page;
  final int perPage;
  final int totalPages;

  PaginatedUsersResponse({
    required this.users,
    required this.total,
    required this.page,
    required this.perPage,
    required this.totalPages,
  });

  factory PaginatedUsersResponse.fromJson(Map<String, dynamic> json) {
    return PaginatedUsersResponse(
      users: (json['data'] as List)
          .map((user) => UserModel.fromJson(user))
          .toList(),
      total: json['total'],
      page: json['page'],
      perPage: json['per_page'],
      totalPages: json['total_pages'],
    );
  }
} 