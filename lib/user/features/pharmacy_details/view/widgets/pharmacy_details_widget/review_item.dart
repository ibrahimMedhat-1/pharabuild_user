import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 40,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white, boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0, 0),
          blurRadius: 3,
        ),
      ]),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: Ibrahim Medhat',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Perfect pharmacy that contains all medicine you may need'
                  ' and it also provide what medicine to not to buy'
                  ' if you believe in palestine',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
          const CircleAvatar(
            minRadius: 30,
            backgroundImage: AssetImage('assets/test/profile_image.jpeg'),
          )
        ],
      ),
    );
  }
}
