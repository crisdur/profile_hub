import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../data/models/user_model.dart';
import '../providers/user_provider.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(usersProvider);
    final refreshController = RefreshController();
    final userNotifier = ref.read(usersProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Hub'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.push('/create-user');
            },
          ),
        ],
      ),
      body: usersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
        data: (users) => SmartRefresher(
          controller: refreshController,
          onRefresh: () async {
            await userNotifier.refresh();
            refreshController.refreshCompleted();
          },
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return UserCard(user: user);
            },
          ),
        ),
      ),
      bottomNavigationBar: usersAsync.when(
        loading: () => const SizedBox.shrink(),
        error: (_, __) => const SizedBox.shrink(),
        data: (users) => BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: userNotifier.canGoToPreviousPage
                      ? () => userNotifier.previousPage()
                      : null,
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: userNotifier.canGoToNextPage
                      ? () => userNotifier.nextPage()
                      : null,
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(user.avatar),
        ),
        title: Text(user.fullName),
        subtitle: Text(user.email),
        onTap: () {
          context.push('/user/${user.id}');
        },
      ),
    );
  }
} 