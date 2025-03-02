// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagesResponse _$MessagesResponseFromJson(Map<String, dynamic> json) =>
    MessagesResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => MessageDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessagesResponseToJson(MessagesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

MessageDataModel _$MessageDataModelFromJson(Map<String, dynamic> json) =>
    MessageDataModel(
      conversationId: json['conversation_id'] as String,
      senderId: json['sender_id'] as String,
      createdAt: json['created_at'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$MessageDataModelToJson(MessageDataModel instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'sender_id': instance.senderId,
      'created_at': instance.createdAt,
      'content': instance.content,
    };
