import 'package:json_annotation/json_annotation.dart';
part 'message_response.g.dart';

@JsonSerializable()
class MessageResponse {
  final List<MessageDataModel> data;

  MessageResponse({required this.data});
  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
}

@JsonSerializable()
class MessageDataModel {
  @JsonKey(name: 'conversation_id')
  final String conversationId;
  @JsonKey(name: 'sender_id')
  final String senderId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final String content;

  MessageDataModel({
    required this.conversationId,
    required this.senderId,
    required this.createdAt,
    required this.content,
  });

  factory MessageDataModel.fromJson(Map<String, dynamic> json) =>
      _$MessageDataModelFromJson(json);
}
