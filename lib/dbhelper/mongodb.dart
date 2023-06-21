import 'dart:developer';

import 'package:demo_app_v4/dbhelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

import '../models/mongoDbModel.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<String> insert(mongoDbModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        // var val = await userCollection.findOne(where.eq("id", data.id));
        // inspect(val);
        return "Data Inserted";
      } else {
        return "Something went wrong while inserting";
      }
    } catch (e) {
      return e.toString();
    }
  }
}