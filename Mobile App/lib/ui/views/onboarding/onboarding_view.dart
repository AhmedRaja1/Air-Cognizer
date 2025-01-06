import 'package:flutter/material.dart';
import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
import 'package:healthcare_360_mobile/ui/views/menu/menu_view.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingView extends StatelessWidget {
  OnboardingView({Key? key}) : super(key: key);

  final List<PageViewModel> _pages = [
    PageViewModel(
      title: "Lorem Ipsum",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      image: Center(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: SvgPicture.asset(HcIllustrations.ob1))),
      decoration: PageDecoration(
        imagePadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        titlePadding: const EdgeInsets.only(top: 0, bottom: 24.0),
        contentMargin: const EdgeInsets.all(15.0),
        titleTextStyle: TextStyles.m_24.copyWith(color: HcColors.blue),
        bodyTextStyle: TextStyles.r_16.copyWith(color: HcColors.black),
        // pageColor: Colors.blue,
      ),
    ),
    PageViewModel(
      title: "Lorem Ipsum",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      image: Center(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: SvgPicture.asset(HcIllustrations.ob2))),
      decoration: PageDecoration(
        imagePadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        titlePadding: const EdgeInsets.only(top: 0, bottom: 24.0),

        contentMargin: const EdgeInsets.all(15.0),
        titleTextStyle: TextStyles.m_24.copyWith(color: HcColors.blue),
        bodyTextStyle: TextStyles.r_16.copyWith(color: HcColors.black),
        // pageColor: Colors.blue,
      ),
    ),
    PageViewModel(
      title: "Lorem Ipsum",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      image: Center(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: SvgPicture.asset(HcIllustrations.ob3))),
      decoration: PageDecoration(
        imagePadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        titlePadding: const EdgeInsets.only(top: 0, bottom: 24.0),
        contentMargin: const EdgeInsets.all(15.0),
        titleTextStyle: TextStyles.m_24.copyWith(color: HcColors.blue),
        bodyTextStyle: TextStyles.r_16.copyWith(color: HcColors.black),
        // pageColor: Colors.blue,
      ),
    ),
    PageViewModel(
      title: "Lorem Ipsum",
      body:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
      image: Center(child: SvgPicture.asset(HcIllustrations.ob4)),
      decoration: PageDecoration(
        imagePadding: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
        titlePadding: const EdgeInsets.only(top: 0, bottom: 24.0),
        contentMargin: const EdgeInsets.all(15.0),
        titleTextStyle: TextStyles.m_24.copyWith(color: HcColors.blue),
        bodyTextStyle: TextStyles.r_16.copyWith(color: HcColors.black),
        // pageColor: Colors.blue,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: _pages,
      onDone: () {
        // When done button is press
        Get.offAll(() => const MenuView());
      },
      onSkip: () {
        // You can also override onSkip callback
        Get.offAll(() => const MenuView());
      },
      showSkipButton: true,
      skip: const CustomText(
        'Skip',
        style: TextStyles.r_12,
      ),
      next: const CustomText(
        'Next',
        style: TextStyles.r_12,
      ),
      done: const CustomText(
        'Done',
        style: TextStyles.b_16,
        color: HcColors.blue,
      ),
      dotsDecorator: const DotsDecorator(
        size: Size.square(10.0),
        activeSize: Size(20.0, 10.0),
        color: Color(0xFFE8E8E8),
        activeColor: HcColors.blue,
        spacing: EdgeInsets.symmetric(horizontal: 3.0),
        // activeShape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(25.0),
        // ),
      ),
    );
  }
}
