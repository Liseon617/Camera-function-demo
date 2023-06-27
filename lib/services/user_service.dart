import 'package:demo_app_v4/api/firestore_api.dart';
import 'package:demo_app_v4/app/app.locator.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import '../app/app.logger.dart';
import '../models/application_models.dart';

class UserService {
  final log = getLogger('UserService');

  final _firestoreApi = locator<FirestoreApi>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  CurrentUser? _currentUser;

  CurrentUser? get currentUser => _currentUser;

  Future<void> syncUserAccount() async {
    final firebaseUserId =
        _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;

    log.v('Sync user $firebaseUserId');

    final userAccount = await _firestoreApi.getUser(userId: firebaseUserId);

    if (userAccount != null) {
      log.v('User account exists. Save as _currentUser');
      _currentUser = userAccount; //check 2
    }
  }

  Future<void> syncOrCreateUserAccount({required CurrentUser user}) async {
    log.i('user:$user');

    await syncUserAccount();

    if (currentUser == null) {
      log.v('We have no user account. Create a new user ....');
      await _firestoreApi.createUser(user: user);
      _currentUser = user;
      log.v('_currentUser has been saved');
    }
  }
}
