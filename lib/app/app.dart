import 'package:demo_app_v4/Services/user_service.dart';
import 'package:demo_app_v4/api/firestore_api.dart';
import 'package:demo_app_v4/ui/address_selection/address_selection_view.dart';
import 'package:demo_app_v4/ui/create_account/create_account_view.dart';
import 'package:demo_app_v4/ui/login/login_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:demo_app_v4/ui/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView),
    CupertinoRoute(page: AddressSelectionView),
    CupertinoRoute(page: CreateAccountView),
    CupertinoRoute(page: LoginView, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirestoreApi),
    Singleton(classType: FirebaseAuthenticationService),
  ],
  logger: StackedLogger(),

)

class AppSetup{
  /** Serves no purpose besides having an annotation attached **/
}