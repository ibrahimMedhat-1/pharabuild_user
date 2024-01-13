import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/profile/manager/chats_cubit/chats_cubit.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatsCubit(),
      child: BlocConsumer<ChatsCubit, ChatsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Chats'),
            ),
            body: ListView.separated(
              itemBuilder: (context, index) => const ListTile(
                leading: CircleAvatar(),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Doctor Name'),
                    Text('Last Message'),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: 100,
            ),
          );
        },
      ),
    );
  }
}
