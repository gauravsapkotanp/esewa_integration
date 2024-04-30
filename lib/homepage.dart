import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:esewa_integration/esewa_constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Esewa Flutter Integration'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Esewa Flutter Integration"),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  try {
                    EsewaFlutterSdk.initPayment(
                      esewaConfig: EsewaConfig(
                        environment: Environment.test,
                        clientId: esewaID,
                        secretId: secretKey,
                      ),
                      esewaPayment: EsewaPayment(
                        productId: "1d71jd81",
                        productName: "Product One",
                        productPrice: "20",
                        callbackUrl: '',
                      ),
                      onPaymentSuccess: (EsewaPaymentSuccessResult data) {
                        debugPrint(
                            ":::SUCCESS DATA --------------------------------::: => $data");
                      },
                      onPaymentFailure: (data) {
                        debugPrint(":::FAILURE::: => $data");
                      },
                      onPaymentCancellation: (data) {
                        debugPrint(":::CANCELLATION::: => $data");
                      },
                    );
                  } on Exception catch (e) {
                    debugPrint("EXCEPTION : ${e.toString()}");
                  }
                },
                child: const Text("Pay with Esewa"),
              ),
            ],
          ),
        ));
  }
}
