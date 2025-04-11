import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/user_model.dart';
import '../../data/models/created_user_model.dart';
import '../../data/services/user_service.dart';

final userServiceProvider = Provider<UserService>((ref) => UserService());

final usersProvider = StateNotifierProvider<UsersNotifier, AsyncValue<List<UserModel>>>((ref) {
  return UsersNotifier(ref.watch(userServiceProvider));
});

class UsersNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  final UserService _userService;
  int _currentPage = 1;
  int _totalPages = 1;

  int get currentPage => _currentPage;

  UsersNotifier(this._userService) : super(const AsyncValue.loading()) {
    loadUsers();
  }

  bool get canGoToPreviousPage => _currentPage > 1;

  bool get canGoToNextPage => _currentPage < _totalPages;

  Future<void> loadUsers() async {
    try {
      state = const AsyncValue.loading();
      final response = await _userService.getUsers(page: _currentPage);
      _totalPages = response.totalPages;
      state = AsyncValue.data(response.users);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> nextPage() async {
    if (canGoToNextPage) {
      _currentPage++;
      await loadUsers();
    }
  }

  Future<void> previousPage() async {
    if (canGoToPreviousPage) {
      _currentPage--;
      await loadUsers();
    }
  }

  Future<void> refresh() async {
    await loadUsers();
  }
}

final userDetailProvider = FutureProvider.family<UserModel, int>((ref, id) async {
  final userService = ref.watch(userServiceProvider);
  return userService.getUserById(id);
});

final createUserProvider = FutureProvider.family<CreatedUserModel, ({String name, String job})>((ref, params) async {
  final userService = ref.watch(userServiceProvider);
  return userService.createUser(name: params.name, job: params.job);
});

final isCreatingUserProvider = StateProvider<bool>((ref) => false); 