import 'package:demo_app_v4/ui/base/authentication_viewmodel.dart';
import 'package:demo_app_v4/ui/create_account/create_account_view.form.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class CreateAccountViewModel extends AuthenticationViewModel {
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  // CreateAccountViewModel(String firstNameValue, String lastNameValue)
  //     : super(
  //           firstName: firstNameValue,
  //           lastName: lastNameValue,
  //           successRoute: Routes.addressSelectionView);
  CreateAccountViewModel() : super(successRoute: Routes.addressSelectionView);

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService.createAccountWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );

  void navigateBack() => navigationService!.back();
}