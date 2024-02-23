import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/user/features/doctors_list/view/doctor_chat_page.dart';
import 'package:intelligent_pharmacy/user/features/profile/manager/chats_cubit/chats_cubit.dart';

class AllChatsPage extends StatelessWidget {
  const AllChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatsCubit()..getAllChats(),
      child: BlocConsumer<ChatsCubit, ChatsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final ChatsCubit cubit = ChatsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Chats'),
            ),
            body: state is GetAllChatsLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => DoctorChatPage(
                                doctorModel: cubit.doctorsList[index],
                              ),
                            ));
                      },
                      // leading: CircleAvatar(
                      //   backgroundImage: CachedNetworkImageProvider(cubit.doctorsList[index].image ?? ''),
                      // ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cubit.doctorsList[index].name!),
                          Text(cubit.doctorsList[index].lastMessage ?? ''),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: cubit.doctorsList.length,
                  ),
          );
        },
      ),
    );
  }
}
