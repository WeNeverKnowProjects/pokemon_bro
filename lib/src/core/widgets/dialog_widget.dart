import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constants/constants.dart';

showLoadingDialog(BuildContext context) => showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Center(
          child: Container(
            height: 100.0,
            width: 150.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
            ),
            child: Center(
              child: Lottie.asset("assets/lotties/loading-animation.json"),
            ),
          ),
        ));

Future<void> showErrorDialog(
  BuildContext context, {
  required String title,
  required String message,
}) =>
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ],
          );
        });

Future<bool> showConfirmationDialog(
  BuildContext context, {
  required String title,
  required String message,
}) async {
  return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(
                  height: defaultPadding / 4,
                ),
                Text(
                  message,
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: primaryColor),
                      child: Text(
                        'No',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: primaryColor,
                                ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                        // Get.back();
                        // return false;
                      },
                    ),
                    const SizedBox(
                      width: defaultPadding / 2,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor),
                      child: Text(
                        'Yes',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
