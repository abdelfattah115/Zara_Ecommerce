import 'package:e_commerce/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool checkBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var displayUserName = ''.obs;
  var displayUserEmail = ''.obs;
  var displayUserPhoto = ''.obs;
  var googleSignIn = GoogleSignIn();

  var isSignedIn = false;
  GetStorage authStorage = GetStorage();

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    displayUserName.value =
        (userProfile != null ? userProfile!.displayName : '')!;
    displayUserEmail.value = (userProfile != null ? userProfile!.email : '')!;
    displayUserPhoto.value =
        (userProfile != null ? userProfile!.photoURL : '')!;
    super.onInit();
  }

  void showVisibility() {
    isVisibility = !isVisibility;

    update();
  }

  void showCheckBox() {
    checkBox = !checkBox;

    update();
  }

  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      displayUserName.value = name;
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        auth.currentUser!.updateDisplayName(name);
      });
      update();
      Get.offNamed(Routes.mainScreen);
      Get.snackbar(
        'Check SignUp',
        'Sign Up Successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ');
      String message = '';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (error) {
      Get.snackbar(
        'error!',
        error.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) =>
              displayUserName.value = auth.currentUser!.displayName!);
      isSignedIn = true;
      authStorage.write('auth', isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
      Get.snackbar(
        'Check Login',
        'Login Successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ');
      String message = '';
      if (error.code == 'user-not-found') {
      } else if (error.code == 'wrong-password') {
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (error) {
      Get.snackbar(
        'error!',
        error.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void googleSignUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await auth.signInWithCredential(credential);

      isSignedIn = true;
      authStorage.write('auth', isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar(
        'error!',
        error.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void facebookSignUpApp() {}

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ');
      String message = '';
      if (error.code == 'user-not-found') {
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOutFormApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      displayUserEmail.value = '';

      isSignedIn = false;
      authStorage.remove('auth');
      update();
      Get.offNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar(
        'error!',
        error.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
