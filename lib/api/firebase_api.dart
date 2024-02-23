import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:to_do_app/core/constants/key_constants.dart';
import 'package:to_do_app/core/utils/common_utils.dart';
import 'package:to_do_app/core/utils/shared_pref_utils.dart';
import 'package:to_do_app/model/user_model.dart';


class FirebaseApi {

  static final CollectionReference currentUserColRef =
      FirebaseFirestore.instance.collection(KeyConstants.keyUsers);

  static final FirebaseAuth authInstance = FirebaseAuth.instance;

  static final CollectionReference currentUserTasksRef =
  currentUserColRef.doc(FirebaseAuth.instance.currentUser!.uid).collection(KeyConstants.keyTasks);



  Future<bool> doesUserExists(String email) async {
    final QuerySnapshot result =
        await currentUserColRef.where(KeyConstants.keyEmail, isEqualTo: email).get();
    return result.size > 0;
  }

  Future<void> updateMasterPassword(String masterPassword) async {
    ///hide keyboard
    hideKeyBoard();
    /// Encrypt master password before sending to server
    return currentUserColRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"master_password": masterPassword});
  }

  FirebaseApi ._();

}
