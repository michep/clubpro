import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('ADMIN PROFILE'),
        ElevatedButton(
          onPressed: () => Get.offAll(() => const SizedBox.shrink(), id: 1),
          child: const Text('BACK'),
        ),
      ],
    );
  }
}
