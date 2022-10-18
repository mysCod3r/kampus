import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kampus/core/constants/color_constant.dart';
import 'package:kampus/core/extension/context_extension.dart';
import 'package:kampus/view/auth/onboard/viewmodel/onboard_view_model.dart';
import 'package:provider/provider.dart';

import '../../../root/view/root_view.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(context.read<OnboardViewModel>().onboardItems[context.watch<OnboardViewModel>().currentIndex].title),
                      Text(context.read<OnboardViewModel>().onboardItems[context.watch<OnboardViewModel>().currentIndex].description),
                    ],
                  )),
              Expanded(
                flex: 4,
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: context.read<OnboardViewModel>().onboardItems.length,
                  itemBuilder: (context, index) => SvgPicture.asset(
                    context.read<OnboardViewModel>().onboardItems[context.watch<OnboardViewModel>().currentIndex].imagePath,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: context.read<OnboardViewModel>().onboardItems.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: context.paddingLow,
                          child: CircleAvatar(backgroundColor: context.watch<OnboardViewModel>().currentIndex != index ? ColorConstants.PURPLE_SH : ColorConstants.PURPLE),
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: ColorConstants.PURPLE,
                        onPressed: () {
                          if (context.read<OnboardViewModel>().onboardItems.length - 1 == context.read<OnboardViewModel>().currentIndex) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const RootView(),
                                ),
                                (route) => false);
                          } else {
                            context.read<OnboardViewModel>().changeIndex();
                          }
                        },
                        child: const Icon(Icons.chevron_right_outlined),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
