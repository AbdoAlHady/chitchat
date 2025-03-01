import 'package:faker/faker.dart';

import '../../features/messages/data/models/conversation_response.dart';

List<ConversationModel> generateRandomConversations(int count) {
  final faker = Faker();
  return List.generate(count, (index) {
    return ConversationModel(
      id: faker.guid.guid(), // توليد UUID عشوائي
      participanName: faker.person.name(), // اسم شخص عشوائي
      lastMessage: faker.lorem.sentence(), // رسالة عشوائية
      lastMessageTime: '2025-02-26T20:19:58.173Z', // وقت عشوائي
    );
  });
}
