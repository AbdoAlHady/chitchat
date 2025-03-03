import 'package:json_annotation/json_annotation.dart';
part 'message_request_body.g.dart';

@JsonSerializable()
class MessageRequestBody {
  @JsonKey(name: 'conversation_id')
  final String conversationId;
  final String content;
  @JsonKey(name: 'sender_id')
  final String senderId;

  MessageRequestBody({
    required this.conversationId,
    required this.content,
    required this.senderId,
  });

  Map<String, dynamic> toJson() => _$MessageRequestBodyToJson(this);
}
