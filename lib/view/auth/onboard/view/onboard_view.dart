import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kampus/core/extension/context_extension.dart';
import 'package:kampus/view/_product/_constants/image_path_svg.dart';

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
              Expanded(flex: 5, child: SvgPicture.asset(SVGImagePaths.instance!.onboardSVG1)),
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: context.paddingLow,
                          child: const CircleAvatar(backgroundColor: Color.fromARGB(255, 0, 222, 19)),
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
                        onPressed: () {},
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
