import 'package:demo_app_v2/ui/base/authentication_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/src/firebase_authentication_service.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import 'create_account_view.form.dart';

class CreateAccountViewModel extends AuthenticationViewModel {
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  CreateAccountViewModel() : super(successRoute: Routes.addressSelectionView);
  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService.createAccountWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );

  void navigateBack() => navigationService!.back();
}
