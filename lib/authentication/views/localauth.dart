import 'package:expense_tracker/main.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

final auth = LocalAuthentication();

Future<void> authenticateUser() async {
  final canAuth =
      await auth.canCheckBiometrics || await auth.isDeviceSupported();

  if (canAuth) {
    final didAuth = await auth.authenticate(
      localizedReason: 'Please authenticate',
      options: const AuthenticationOptions(
        biometricOnly: true,
        stickyAuth: true,
      ),
    );

    if (didAuth) {
      navigatorKey.currentContext?.go('/home');
    }
  }
}
