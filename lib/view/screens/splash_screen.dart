import 'package:flutter/material.dart';
import 'package:sanber_flutter_mini_project_2/view/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _mainController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _mainController = AnimationController(
      duration:  const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: const Offset(-0.5, 0),
      end: const Offset(0.5, 0),
    ).animate(CurvedAnimation(
      parent: _mainController,
      curve: Curves.easeInOut,
    ));

    Future.delayed(const Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())));
  }

  @override
  void dispose() {
    _mainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.primaryContainer,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _mainController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                      MediaQuery.of(context).size.width /
                          7 *
                          _animation.value.dx,
                      0),
                  child: child,
                );
              },
              child: Text(
                'Rpedia',
                style: textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colorScheme.primary.withOpacity(0.2),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _mainController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                      MediaQuery.of(context).size.width /
                          8 *
                          _animation.value.dx,
                      0),
                  child: child,
                );
              },
              child: Text(
                'Rpedia',
                style: textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: colorScheme.primary.withOpacity(0.6),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 128),
              child: AnimatedBuilder(
                animation: _mainController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(
                        MediaQuery.of(context).size.width /
                            8 *
                            _animation.value.dx,
                        0),
                    child: child,
                  );
                },
                child: Icon(
                      Icons.shopping_bag,
                      color: colorScheme.primary.withOpacity(0.5),
                      size: 64,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
