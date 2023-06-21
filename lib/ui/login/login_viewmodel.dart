import 'package:demo_app_v4/ui/base/authentication_viewmodel.dart';
import 'package:demo_app_v4/ui/login/login_view.form.dart';
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class LoginViewModel extends AuthenticationViewModel {
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  LoginViewModel() : super(successRoute: Routes.addressSelectionView);

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService.loginWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );

  void navigateToCreateAccount() => navigationService.navigateTo(Routes.createAccountView);
}
