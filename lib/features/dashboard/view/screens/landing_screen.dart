import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kitchen_ecommerce/common/colors.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/screens/home_screen.dart';
import 'package:kitchen_ecommerce/features/cart/view/screens/cart_screen.dart';
import 'package:kitchen_ecommerce/features/dashboard/controller/dashboard_controller.dart';
import 'package:kitchen_ecommerce/features/wishlist/view/screens/wishlist_screen.dart';
import 'package:kitchen_ecommerce/features/settings/view/screens/profile_screen.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    CartScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final lanRef = ref.watch(lanController);
    return Scaffold(
      extendBody: true,
      body: screens[lanRef.selIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: lanRef.selIndex,
        onTap: (index) => lanRef.updateInd(index),
        backgroundColor: ComColors.priColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withValues(alpha: 0.6),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: lanRef.selIndex == 0 ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                lanRef.selIndex == 0 ? Icons.home : Icons.home_outlined,
                color: lanRef.selIndex == 0
                    ? ComColors.priLightColor
                    : Colors.white,
                size: 30.r,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: lanRef.selIndex == 1 ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                lanRef.selIndex == 1
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined,
                color: lanRef.selIndex == 1
                    ? ComColors.priLightColor
                    : Colors.white,
                size: 30.r,
              ),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: lanRef.selIndex == 2 ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                lanRef.selIndex == 2 ? Icons.favorite : Icons.favorite_outline,
                color: lanRef.selIndex == 2
                    ? ComColors.priLightColor
                    : Colors.white,
                size: 30.r,
              ),
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: lanRef.selIndex == 3 ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                lanRef.selIndex == 3 ? Icons.person_2 : Icons.person_2_outlined,
                color: lanRef.selIndex == 3
                    ? ComColors.priLightColor
                    : Colors.white,
                size: 30.r,
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
