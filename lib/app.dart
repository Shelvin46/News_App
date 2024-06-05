import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/color_constants.dart';
import 'package:news_app/core/constants/text_style_constants.dart';
import 'package:news_app/features/news/presentation/blocs/get_articles/get_articles_bloc.dart';
import 'package:news_app/features/splash_screen/screens/splash_screen.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.black,
    onPrimary: AppColors.black,
    secondary: AppColors.black,
    onSecondary: AppColors.white,
    error: AppColors.red,
    onError: AppColors.red,
    // background: AppColors.black,
    // onBackground: AppColors.black,
    surface: AppColors.black,
    onSurface: AppColors.black,
  );

  ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.white,
    onPrimary: AppColors.black,
    secondary: AppColors.white,
    onSecondary: AppColors.black,
    error: AppColors.red,
    onError: AppColors.red,
    // background: AppColors.white,
    // onBackground: AppColors.grey,
    surface: AppColors.white,
    onSurface: AppColors.white,
  );

  ButtonThemeData buttonThemeData = ButtonThemeData(
    buttonColor: AppColors.black,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  TextTheme textTheme = TextTheme(
    displayLarge: TextStyleConstants.displayLargeTextStyle,
    displaySmall: TextStyleConstants.displaySmallTextStyle,
    labelSmall: TextStyleConstants.labelSmallTextStyle,
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetArticlesBloc>(
          create: (context) => GetArticlesBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News+',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          fontFamily: TextStyleConstants.fontFamily,
          useMaterial3: true,
          colorScheme: lightColorScheme,
          buttonTheme: buttonThemeData,
          textTheme: textTheme,
        ),
        darkTheme: ThemeData(
          fontFamily: TextStyleConstants.fontFamily,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 1),
          useMaterial3: true,
          colorScheme: darkColorScheme,
          buttonTheme: buttonThemeData,
          textTheme: textTheme,
        ),
        themeMode: MediaQuery.platformBrightnessOf(context) == Brightness.dark
            ? ThemeMode.dark
            : ThemeMode.light,
        home: const SplashScreen(),
      ),
    );
  }
}
