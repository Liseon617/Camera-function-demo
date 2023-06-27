import 'package:demo_app_v4/app/app.locator.dart';
import 'package:demo_app_v4/app/app.logger.dart';
import 'package:demo_app_v4/exceptions/firestore_api_exception.dart';
import 'package:demo_app_v4/models/application_models.dart';
import 'package:demo_app_v4/Services/user_service.dart';
import 'package:demo_app_v4/ui/login_signup/login_screen_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../dbhelper/mongodb.dart';
import '../../models/mongoDbModel.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final log = getLogger('AuthenticationViewModel');

  final userService = locator<UserService>();
  final navigationService = locator<NavigationService>();

  final firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  final String successRoute;
  AuthenticationViewModel({required this.successRoute});

  @override
  void setFormStatus() {}

  Future<FirebaseAuthenticationResult> runAuthentication();

  Future saveData() async {
    log.i('valued:$formValueMap');

    try {
      final result = await runAuthentication();

      await _handleAuthenticationResponse(result, "Common");
    } on FirestoreApiException catch (e) {
      log.e(e.toString());
      setValidationMessage(e.toString());
    }
  }

  Future<void> useGoogleAuthentication() async {
    final result = await firebaseAuthenticationService.signInWithGoogle();
    await _handleAuthenticationResponse(result, "Google");
    log.v(result.additionalUserInfo);
    log.v(result.user);
  }

  Future<void> useAppleAuthentication() async {
    final result = await firebaseAuthenticationService.signInWithApple(
      appleRedirectUri:
          'https://fir-app-v2-751f6.firebaseapp.com/__/auth/handler',
      appleClientId: '',
    );
    await _handleAuthenticationResponse(result, "Apple");
  }

  //check if the result has an error. If it doesn't we navigate to the success view
  //else we show the friendly validation message.
  Future<void> _handleAuthenticationResponse(
      FirebaseAuthenticationResult authResult, String type) async {
    log.v('authResult.hasError:${authResult.hasError}');
    if (registerPasswordValue != loginRegisterPasswordValue) {
      setValidationMessage("Please confirm your password again");
      notifyListeners();
    } else if (!authResult.hasError && authResult.user != null) {
      final user = authResult.user;

      await userService.syncOrCreateUserAccount(
          user: CurrentUser(
        id: user!.uid,
        //displayName: type == "Common" ? "${firstNameValue!} ${lastNameValue!}" : user.displayName,
        displayName:
            type == "Common" ? registerUsernameValue! : user.displayName,
        email: user.email,
      ));
      //log new user into mongoDb
      //if(firstNameValue != null && lastNameValue != null || type == "Google" || type == "Apple"){
      if (registerUsernameValue != null ||
          type == "Google" ||
          type == "Apple") {
        final mongoDbModel data;
        if (type == "Google" || type == "Apple") {
          data = mongoDbModel(
            id: user.uid,
            userName: user.displayName!,
            accountType: type,
          );
        } else {
          data = mongoDbModel(
            id: user.uid,
            userName: registerUsernameValue!,
            accountType: type,
          );
        }
        await MongoDatabase.insert(data);
      }
      // navigate to success route
      navigationService.replaceWith(successRoute);
    } else {
      if (!authResult.hasError && authResult.user == null) {
        log.wtf(
            'We have no error but the user is null. This should not be happening');
        log.w('Authentication Failed ${authResult.errorMessage}');
      }
      setValidationMessage(authResult.errorMessage);
      notifyListeners();
    }
  }
}
