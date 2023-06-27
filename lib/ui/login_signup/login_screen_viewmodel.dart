import 'package:demo_app_v4/ui/base/authentication_viewmodel.dart';
import 'package:demo_app_v4/ui/login_signup/login_screen_view.form.dart';
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class LoginScreenViewModel extends AuthenticationViewModel {
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  LoginScreenViewModel() : super(successRoute: Routes.addressSelectionView);

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() {
    if (authTypeValue! == "Login") {
      return _firebaseAuthenticationService.loginWithEmail(
        email: loginEmailValue!,
        password: loginPasswordValue!,
      );
    }
    return _firebaseAuthenticationService.createAccountWithEmail(
      email: registerEmailValue!,
      password: loginRegisterPasswordValue!,
    );
  }

  // void navigateBack() => navigationService!.back();
}
