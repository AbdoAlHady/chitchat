import 'package:json_annotation/json_annotation.dart';
part 'conversation_model.g.dart';

@JsonSerializable()
class ConversationModel {
  @JsonKey(name: 'conversation_id')
  final String id;
  @JsonKey(name: 'participation_name')
  final String participanName;
  @JsonKey(name: 'last_message')
  final String lastMessage;
  @JsonKey(name: 'last_message_time')
  final String lastMessageTime;
  ConversationModel({
    required this.participanName,
    required this.id,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ConversationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationModelToJson(this);
}
