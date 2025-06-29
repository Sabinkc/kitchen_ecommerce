import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/widgets/home_banner_row.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/widgets/home_bottomproducts.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/widgets/home_categoryrow.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/widgets/home_searchrow.dart';
import 'package:kitchen_ecommerce/features/dashboard/view/widgets/home_topbar.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const HomeTopbar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: height * 0.02,
                children: [
                  SizedBox(height: height * 0.005),
                  const HomeSearchRow(),
                  const HomeBannerRow(),
                  const HomeCategoryrow(),
                  const HomeBottomproducts(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
