import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/shared/cubit/states.dart';

class LoginBloc extends Cubit<DeliveryStates> {
  LoginBloc() : super(InitialLoginState());

  static LoginBloc object(context) => BlocProvider.of(context);

  bool isHidden = true;
  void changePasswordStatus() {
    isHidden = !isHidden;
    emit(ChangeLoginPasswordStatus());
  }

  late String verificationId;
  createAccountUsingPhoneNumber({phoneNumber, required context}) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        } else {
          print(e.message);
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
      },
    );
  }
}
