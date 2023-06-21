//create a user; create a new user document in the database using the id parsed in
//get a user; return the user from the users collection if the user id exists
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_app_v4/app/app.logger.dart';
import 'package:demo_app_v4/exceptions/firestore_api_exception.dart';

import '../models/application_models.dart';

class FirestoreApi {
  final log = getLogger('FirestoreApi');

  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  //Create user
  Future<void> createUser({required CurrentUser user}) async {
    log.i('user:$user');
    try {
      final userDocument = usersCollection.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('UserCreated at ${userDocument.path}');
    } catch (error) {
      throw FirestoreApiException(
          message: 'Failed to create new user', devDetails: '$error');
    }
  }

  Future<CurrentUser?> getUser({required String userId}) async {
    log.i('userId:$userId');

    if (userId.isNotEmpty) {
      final userDoc = await usersCollection.doc(userId).get();
      if (!userDoc.exists) {
        log.v('We have no user with id $userId in our database');
        return null;
      }

      //check 1
      final userData = userDoc.data() as Map<String, dynamic>;
      log.v('User found. Data: $userData');

      return CurrentUser.fromJson(userData);
    } else {
      throw FirestoreApiException(
          message: 'Your userId passed in is empty. Please pass in a valid user if from your Firebase user');
    }
  }
}
