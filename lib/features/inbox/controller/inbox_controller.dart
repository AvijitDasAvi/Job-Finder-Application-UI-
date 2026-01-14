import 'package:get/get.dart';

class InboxController extends GetxController {
  late String userName;
  final messages = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Get user name from arguments
    if (Get.arguments != null && Get.arguments['userName'] != null) {
      userName = Get.arguments['userName'];
    }
    _loadMessages();
  }

  void _loadMessages() {
    messages.value = [
      {'text': 'Hello, nice to meet you.', 'time': '10:01 am', 'isMe': false},
      {
        'text': 'Nice to meet you!',
        'time': '10:00 am',
        'isMe': true,
        'status': 'read',
      },
      {
        'text': 'Hey Jhon! Loved your stream tonight!',
        'time': '10:00 am',
        'isMe': true,
        'status': 'read',
      },
      {'text': 'Aww. Thank you! Enjoyed it', 'time': '10:03 am', 'isMe': false},
      {
        'text': 'Do you stream every weekend?',
        'time': '10:00 am',
        'isMe': true,
        'status': 'read',
      },
      {
        'text': 'Yes! Saturday night are my usual',
        'time': '10:06 am',
        'isMe': false,
      },
      {
        'text': 'Nice! Just tell me about your weekend plan',
        'time': '10:00 am',
        'isMe': true,
        'status': 'read',
      },
      {'text': 'Sure!', 'time': '10:06 am', 'isMe': false},
    ];
  }

  void onBackTap() {
    Get.back();
  }

  void onMoreOptionsTap() {
    // Handle more options menu
  }

  void onSendMessage(String message) {
    if (message.isNotEmpty) {
      messages.add({
        'text': message,
        'time': _getCurrentTime(),
        'isMe': true,
        'status': 'sent',
      });
    }
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    return '${now.hour}:${now.minute.toString().padLeft(2, '0')}';
  }
}
