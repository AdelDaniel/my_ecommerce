part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  final String themeName;
  const ThemeState({required this.themeData, required this.themeName});

  @override
  List<Object> get props => [themeName];
}

// class IntialThemeState extends ThemeState {
//   const IntialThemeState()
//       : super(
//           themeData: ThemeData(
//               brightness: Brightness.light,
//               primaryColor: Colors.blue,
//               accentColor: Colors.black),
//           themeName: "Blue Light",
//         );

//   @override
//   List<Object> get props => [];
// }
