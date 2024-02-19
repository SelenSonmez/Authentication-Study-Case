import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_study_case/models/atendee_model.dart';

import '../controllers/user_controller.dart';

class AttendeeListView extends ConsumerWidget {
  const AttendeeListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final atendeesAsyncValue = ref.watch(attendeeModelProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          centerTitle: true,
          backgroundColor: Colors.deepPurple.shade400,
          title: Container(
            width: 270,
            height: 45,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Text(
              textAlign: TextAlign.center,
              'Attendee List',
              style: TextStyle(
                fontSize: 35,
                color: Colors.deepPurple.shade400,
              ),
            ),
          ),
        ),
        body: atendeesAsyncValue.when(
          data: (atendees) {
            return ListView.builder(
              itemCount: atendees.length,
              itemBuilder: (context, index) {
                final atendee = atendees[index];
                return _AttendeeCardView(atendee: atendee);
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        ),
      ),
    );
  }
}

class _AttendeeCardView extends StatelessWidget {
  const _AttendeeCardView({required this.atendee});
  final AtendeeModel atendee;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 13,
        color: Colors.grey.shade100,
        child: Padding(
            padding: const EdgeInsets.all(17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(atendee.avatar),
                  radius: 50,
                ),
                const SizedBox(
                  width: 20,
                ),
                // Wrapping with flexible to ensure overflowing of texts.
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${atendee.firstName} ${atendee.lastName}",
                        maxLines: 2,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Text(
                        atendee.email,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
