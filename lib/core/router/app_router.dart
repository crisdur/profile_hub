import 'package:go_router/go_router.dart';
import 'package:profile_hub/features/users/presentation/screens/create_user_screen.dart';
import 'package:profile_hub/features/users/presentation/screens/home_screen.dart';
import 'package:profile_hub/features/users/presentation/screens/user_detail_screen.dart';
import 'package:profile_hub/features/users/presentation/screens/created_user_screen.dart';
import 'package:profile_hub/features/users/data/models/created_user_model.dart';
import '../animations/custom_page_transitions.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) => CustomPageTransitions.fadeIn(
        const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/create-user',
      name: 'create-user',
      pageBuilder: (context, state) => CustomPageTransitions.scaleIn(
        const CreateUserScreen(),
      ),
    ),
    GoRoute(
      path: '/user/:id',
      name: 'user-detail',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return CustomPageTransitions.slideFromRight(
          UserDetailScreen(userId: id),
        );
      },
    ),
    GoRoute(
      path: '/created-user',
      name: 'created-user',
      pageBuilder: (context, state) {
        final user = state.extra as CreatedUserModel;
        return CustomPageTransitions.slideFromRight(
          CreatedUserScreen(user: user),
        );
      },
    ),
  ],
); 