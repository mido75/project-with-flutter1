// import 'package:flutter/material.dart';
//
// class PasswordVisibilityController extends StatefulWidget {
//
//
//   @override
//   State<PasswordVisibilityController> createState() =>
//       _PasswordVisibilityControllerState();
// }
//
// class _PasswordVisibilityControllerState
//     extends State<PasswordVisibilityController> {
//   bool _isPasswordVisible = false;
//
//   bool get isPasswordVisible => _isPasswordVisible;
//
//   void togglePasswordVisibility() {
//     setState(() {
//       _isPasswordVisible = !_isPasswordVisible;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _PasswordVisibilityControllerInheritedWidget(
//       isPasswordVisible: _isPasswordVisible,
//       togglePasswordVisibility: togglePasswordVisibility,
//       child: Scaffold(),
//     );
//   }
// }
//
// class _PasswordVisibilityControllerInheritedWidget
//     extends InheritedWidget {
//   final bool isPasswordVisible;
//   final VoidCallback togglePasswordVisibility;
//
//   _PasswordVisibilityControllerInheritedWidget({
//     required this.isPasswordVisible,
//     required this.togglePasswordVisibility,
//     required Widget child,
//   }) : super(child: child);
//
//   @override
//   bool updateShouldNotify(
//       _PasswordVisibilityControllerInheritedWidget oldWidget) {
//     return isPasswordVisible != oldWidget.isPasswordVisible;
//   }
// }
//
// extension PasswordVisibilityControllerExtension on BuildContext {
//   bool get isPasswordVisible =>
//       dependOnInheritedWidgetOfExactType<_PasswordVisibilityControllerInheritedWidget>()!
//           .isPasswordVisible;
//
//   void togglePasswordVisibility() =>
//       dependOnInheritedWidgetOfExactType<_PasswordVisibilityControllerInheritedWidget>()!
//           .togglePasswordVisibility();
// }