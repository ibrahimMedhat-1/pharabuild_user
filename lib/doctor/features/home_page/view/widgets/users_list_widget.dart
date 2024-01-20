import 'package:flutter/material.dart';
import 'package:intelligent_pharmacy/models/chat_user_model.dart';

import '../../../../../shared/custom_transitions/custom_transitions.dart';
import '../../../chat/view/doctor_chat_page.dart';

class UsersListWidget extends StatelessWidget {
  final List<ChatUserModel> users;

  const UsersListWidget({required this.users, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            Navigator.push(
              context,
              NavigateSlideTransition(
                  child: ChatPage(
                chatUserModel: users[index],
              )),
            );
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https:${users[index].image ?? ''}'),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(users[index].name ?? ''),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      users[index].lastMessage ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(users[index].lastMessageDate ?? ''),
                ],
              ),
            ],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }
}
