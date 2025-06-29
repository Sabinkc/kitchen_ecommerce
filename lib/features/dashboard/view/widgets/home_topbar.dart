import 'package:flutter/material.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:badges/badges.dart' as b;

class HomeTopbar extends StatelessWidget {
  const HomeTopbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      pinned: true,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          const SizedBox(width: 0),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/profile.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Text(
            "Sabin K.C.",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ComColors.lightGrey,
            ),
            child: b.Badge(
              badgeStyle: const b.BadgeStyle(padding: EdgeInsets.all(4)),
              position: b.BadgePosition.topEnd(top: 10, end: 10),
              child: const Center(child: Icon(Icons.notifications_outlined)),
            ),
          ),
        ),
      ],
    );
  }
}
