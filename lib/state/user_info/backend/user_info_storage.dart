import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:instagram_clone_with_riverpod/state/constants/firebase_collection_name.dart';
import 'package:instagram_clone_with_riverpod/state/constants/firebase_field_name.dart';
import 'package:instagram_clone_with_riverpod/state/user_info/models/user_info_payload.dart';

import '../../posts/typedefs/user_id.dart';

@immutable
class UserInfoStorage {
  const UserInfoStorage();

  Future<bool> saveUserInfo(
      {required UserId userId,
      required String displayName,
      required String? email}) async {
    final userInfo = await FirebaseFirestore.instance
        .collection(
          FirebaseFieldName.users,
        )
        .where(FirebaseFieldName.userId, isEqualTo: userId)
        .limit(1)
        .get();

    try {
      if (userInfo.docs.isNotEmpty) {
        await userInfo.docs.first.reference.update({
          FirebaseFieldName.displayName: displayName,
          FirebaseFieldName.email: email ?? ''
        });
        return true;
      }

      final payLoad = UserInfoPayload(
          userId: userId, displayName: displayName, email: email);
      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.users)
          .add(payLoad);
      return true;
    } catch (e) {
      return false;
    }
  }
}
