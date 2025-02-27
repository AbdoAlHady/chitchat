// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
