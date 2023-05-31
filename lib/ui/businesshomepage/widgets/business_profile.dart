import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessProfile extends StatelessWidget {
  const BusinessProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('BUSINESS PROFILE'),
        ElevatedButton(
          onPressed: () => Get.offAll(() => const SizedBox.shrink(), id: 1),
          child: const Text('BACK'),
        ),
      ],
    );
  }
}
