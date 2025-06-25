import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/auth/view/screens/home_screen.dart';
import 'package:kitchen_ecommerce/features/cart/view/screens/cart_screen.dart';
import 'package:kitchen_ecommerce/features/dashboard/controller/dashboard_controller.dart';
import 'package:kitchen_ecommerce/features/favourites/view/screens/favourite_screen.dart';
import 'package:kitchen_ecommerce/features/settings/view/screens/settings_screen.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final lanRef = ref.watch(lanController);
    return Scaffold(
      extendBody: true,
      body: screens[lanRef.selIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: ComColors.priColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 0: Home
              InkWell(
                onTap: () => lanRef.updateInd(0),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: lanRef.selIndex == 0
                        ? Colors.white
                        : ComColors.priColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    lanRef.selIndex == 0 ? Icons.home : Icons.home_outlined,
                    color: lanRef.selIndex == 0
                        ? ComColors.priLightColor
                        : Colors.white,
                    size: 30,
                  ),
                ),
              ),

              // 1: Bag
              InkWell(
                onTap: () => lanRef.updateInd(1),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: lanRef.selIndex == 1
                        ? Colors.white
                        : ComColors.priColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    lanRef.selIndex == 1
                        ? Icons.shopping_bag
                        : Icons.shopping_bag_outlined,
                    color: lanRef.selIndex == 1
                        ? ComColors.priLightColor
                        : Colors.white,
                    size: 30,
                  ),
                ),
              ),

              // 2: Favorite
              InkWell(
                onTap: () => lanRef.updateInd(2),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: lanRef.selIndex == 2
                        ? Colors.white
                        : ComColors.priColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    lanRef.selIndex == 2
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color: lanRef.selIndex == 2
                        ? ComColors.priLightColor
                        : Colors.white,
                    size: 30,
                  ),
                ),
              ),

              // 3: Settings
              InkWell(
                onTap: () => lanRef.updateInd(3),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: lanRef.selIndex == 3
                        ? Colors.white
                        : ComColors.priColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    lanRef.selIndex == 3
                        ? Icons.settings
                        : Icons.settings_outlined,
                    color: lanRef.selIndex == 3
                        ? ComColors.priLightColor
                        : Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
