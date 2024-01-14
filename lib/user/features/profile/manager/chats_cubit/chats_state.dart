part of 'chats_cubit.dart';

abstract class ChatsState {}

class ChatsInitial extends ChatsState {}

class GetAllChatsLoading extends ChatsState {}

class GetAllChatsSuccessfully extends ChatsState {}

class GetAllChatsError extends ChatsState {}
