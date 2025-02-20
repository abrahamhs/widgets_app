
import 'package:go_router/go_router.dart';
import '../../presentation/screen/screens.dart';



// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.routeName,
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.routeName,
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.routeName,
      builder: (context, state) => CardsScreen(),
    ),
    GoRoute(
      path: '/progress_screen',
      name: ProgressScreen.routeName,
      builder: (context, state) => ProgressScreen(),
    ),
    GoRoute(path:'/snackbar_screen',
      name: SnackbarScreen.routeName,
      builder: (context, state) => SnackbarScreen(),
    ),
    GoRoute(
      path:'/animated_screen',
      name: AnimatedScreen.routeName,
      builder: (context, state) => AnimatedScreen(),
    ),
     GoRoute(
      path:'/app_tutorial_screen',
      name: AppTutorialScreen.routeName,
      builder: (context, state) => AppTutorialScreen(),
    ),
    

    
    
    
    
  ],
);