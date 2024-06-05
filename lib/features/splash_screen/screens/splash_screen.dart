import 'package:flutter/material.dart';
import 'package:news_app/core/extensions/page_navigation_extension.dart';
import 'package:news_app/features/news/presentation/screens/article_screen/article_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // delay for 2 seconds and then navigate to home screen
    Future.delayed(const Duration(seconds: 2), () {
      context.pushReplacementWithTransition(
        const ArticleScreen(),
        PageTransitionType.rightToLeftWithFade,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News+",
              style: Theme.of(context).textTheme.displayLarge,
            )
          ],
        ),
      ),
    ));
  }
}
