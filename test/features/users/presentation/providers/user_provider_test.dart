import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:profile_hub/features/users/data/models/user_model.dart';
import 'package:profile_hub/features/users/data/services/user_service.dart';
import 'package:profile_hub/features/users/presentation/providers/user_provider.dart';
import 'user_provider_test.mocks.dart';

@GenerateMocks([UserService])
void main() {
  late MockUserService mockUserService;
  late ProviderContainer container;
  late List<UserModel> mockUsers;
  late PaginatedUsersResponse mockResponse;

  setUp(() {
    mockUserService = MockUserService();
    container = ProviderContainer(
      overrides: [
        userServiceProvider.overrideWithValue(mockUserService),
      ],
    );

    mockUsers = List.generate(12, (index) => UserModel(
      id: '${index + 1}',
      email: 'test${index + 1}@test.com',
      firstName: 'Test',
      lastName: 'User${index + 1}',
      avatar: '',
    ));

    mockResponse = PaginatedUsersResponse(
      users: mockUsers,
      total: 12,
      page: 1,
      perPage: 6,
      totalPages: 2,
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('UsersNotifier', () {
    test('initial state is loading', () async {
      when(mockUserService.getUsers(page: 1))
          .thenAnswer((_) async => mockResponse);

      final usersNotifier = container.read(usersProvider.notifier);
      expect(usersNotifier.state, const AsyncValue<List<UserModel>>.loading());
    });

    test('loadUsers success', () async {
      when(mockUserService.getUsers(page: 1))
          .thenAnswer((_) async => mockResponse);

      await container.read(usersProvider.notifier).loadUsers();
      expect(container.read(usersProvider).value, mockUsers);
      expect(container.read(usersProvider.notifier).canGoToNextPage, true);
    });

    test('loadUsers error', () async {
      when(mockUserService.getUsers(page: 1))
          .thenThrow(Exception('Failed to load users'));

      await container.read(usersProvider.notifier).loadUsers();
      expect(container.read(usersProvider).hasError, true);
    });

    test('nextPage and previousPage', () async {
      when(mockUserService.getUsers(page: 1))
          .thenAnswer((_) async => mockResponse);
      when(mockUserService.getUsers(page: 2))
          .thenAnswer((_) async => mockResponse);

      await container.read(usersProvider.notifier).loadUsers();
      clearInteractions(mockUserService);

      await container.read(usersProvider.notifier).nextPage();
      verify(mockUserService.getUsers(page: 2)).called(1);

      clearInteractions(mockUserService);

      await container.read(usersProvider.notifier).previousPage();
      verify(mockUserService.getUsers(page: 1)).called(1);
    });

    test('refresh', () async {
      when(mockUserService.getUsers(page: 1))
          .thenAnswer((_) async => mockResponse);

      await container.read(usersProvider.notifier).loadUsers();
      clearInteractions(mockUserService);

      await container.read(usersProvider.notifier).refresh();
      verify(mockUserService.getUsers(page: 1)).called(1);
    });
  });
} 