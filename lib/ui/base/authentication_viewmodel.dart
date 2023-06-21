import 'package:demo_app_v4/app/app.locator.dart';
import 'package:demo_app_v4/app/app.logger.dart';
import 'package:demo_app_v4/exceptions/firestore_api_exception.dart';
import 'package:demo_app_v4/models/application_models.dart';
import 'package:demo_app_v4/Services/user_service.dart';
import 'package:demo_app_v4/ui/create_account/create_account_view.form.dart';
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
  // final String firstName;
  // final String lastName;
  AuthenticationViewModel({/*required this.firstName, required this.lastName,*/ required this.successRoute});


  @override
  void setFormStatus() {}

  Future<FirebaseAuthenticationResult> runAuthentication();

  Future saveData() async {
    log.i('valued:$formValueMap');

    try {
      final result =
          await runAuthentication();

      await _handleAuthenticationResponse(result);
    } on FirestoreApiException catch (e) {
      log.e(e.toString());
      setValidationMessage(e.toString());
    }
  }

  Future<void> useGoogleAuthentication() async {
    final result = await firebaseAuthenticationService.signInWithGoogle();
    await _handleAuthenticationResponse(result);
  }

  Future<void> useAppleAuthentication() async {
    final result = await firebaseAuthenticationService.signInWithApple(
      appleRedirectUri:
          'https://fir-app-v2-751f6.firebaseapp.com/__/auth/handler',
      appleClientId: '',
    );
    await _handleAuthenticationResponse(result);
  }

  //check if the result has an error. If it doesn't we navigate to the success view
  //else we show the friendly validation message.
  Future<void> _handleAuthenticationResponse(
      FirebaseAuthenticationResult authResult) async {
    log.v('authResult.hasError:${authResult.hasError}');

    if (!authResult.hasError && authResult.user != null) {
      final user = authResult.user;
      user?.updateDisplayName(firstNameValue!);
      await userService.syncOrCreateUserAccount(user:
        CurrentUser(
          id: user!.uid,
          email: user!.email,
        )
      );
      //log new user into mongoDb
      final data = mongoDbModel(
        id: user!.uid,
        firstName: firstNameValue!,
        lastName: lastNameValue!,
      );
      await MongoDatabase.insert(data);
      // navigate to success route
      navigationService.replaceWith(successRoute);
    } else {
      if(!authResult.hasError && authResult.user == null){
        log.wtf('We have no error but the user is null. This should not be happening');
        log.w('Authentication Failed ${authResult.errorMessage}');
      }
      setValidationMessage(authResult.errorMessage);
      notifyListeners();
    }
  }
}
