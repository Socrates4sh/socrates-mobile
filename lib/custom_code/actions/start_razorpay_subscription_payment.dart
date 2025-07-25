// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions
import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'dart:async';
import '../../auth/firebase_auth/auth_util.dart';

Future startRazorpaySubscriptionPayment(
  String subscriptionId,
  Future Function() failureAction,
  Future Function() successAction,
) async {
  var razorpay = Razorpay();

  String razorpayKeyId = "rzp_live_80exC6ZrHSwW5F";
  // razorpay.initilizeSDK(razorpayKeyId);

  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
      (PaymentSuccessResponse response) {
    print('Payment Success: ${response.paymentId}');
    razorpay.clear();
    successAction();
  });

  razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (PaymentFailureResponse response) {
    print('Payment Error: ${response.code} | ${response.message}');
    razorpay.clear();
    failureAction();
  });

  razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
      (ExternalWalletResponse response) {
    print('External Wallet: ${response.walletName}');
    // Optional: Handle wallet selected
  });

  var options = {
    'key': razorpayKeyId, // your Razorpay Key ID
    'subscription_id': subscriptionId,
    'name': 'Socrates',
    'description': 'Subscription Payment',

    'theme': {
      'color': '#192452',
    },
    'prefill': {
      'contact': currentPhoneNumber, // User's phone number
      'email': "user@gmail.com", // User's email
    },
    'method': {
      'upi': {
        'flow': 'intent', // This makes Razorpay open UPI apps directly
      }
    },
    'config': {
      'display': {
        'preferences': {
          'show_default_blocks': false, // Hide default Razorpay UI blocks
        },
        'blocks': {
          'upi': {
            'name': 'Pay using UPI',
            'method': {
              'upi': true,
            }
          }
        },
        'sequence': ['upi'] // Prioritize UPI in display
      }
    },
  };

  try {
    razorpay.open(options);
  } catch (e) {
    print('Error opening Razorpay: $e');
  }
}
