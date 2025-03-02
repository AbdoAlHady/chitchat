// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationResponse _$ConversationResponseFromJson(
        Map<String, dynamic> json) =>
    ConversationResponse(
      conversations: (json['data'] as List<dynamic>)
          .map((e) => ConversationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConversationResponseToJson(
        ConversationResponse instance) =>
    <String, dynamic>{
      'data': instance.conversations,
    };

ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) =>
    ConversationModel(
      participanName: json['participation_name'] as String,
      id: json['conversation_id'] as String,
      lastMessage: json['last_message'] as String,
      lastMessageTime: json['last_message_time'] as String,
    );

Map<String, dynamic> _$ConversationModelToJson(ConversationModel instance) =>
    <String, dynamic>{
      'conversation_id': instance.id,
      'participation_name': instance.participanName,
      'last_message': instance.lastMessage,
      'last_message_time': instance.lastMessageTime,
    };
