// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageRequestBody _$MessageRequestBodyFromJson(Map<String, dynamic> json) =>
    MessageRequestBody(
      conversationId: json['conversation_id'] as String,
      content: json['content'] as String,
      senderId: json['sender_id'] as String,
    );

Map<String, dynamic> _$MessageRequestBodyToJson(MessageRequestBody instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'content': instance.content,
      'sender_id': instance.senderId,
    };
