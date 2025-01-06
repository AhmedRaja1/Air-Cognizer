import 'package:flutter/material.dart';

export 'package:get/get.dart';

// export 'package:extended_image/extended_image.dart';
import 'dart:developer';
import 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:provider/provider.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:provider/provider.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_svg/svg.dart';
export '../shared_widgets/custom_text.dart';
export '../../core/others/colors.dart';
export '../../core/others/text_styles.dart';
export '../../core/others/illustrations.dart';
export '../../core/others/icons.dart';
export 'dart:developer';

class BaseViewWidget extends StatelessWidget {
  final AppBar? appBar;
  final bool avoidScrollView;
  final Widget? body;
  final FloatingActionButton? fab;
  final EdgeInsets? margin;
  final BottomNavigationBar? bottomNavigationBar;
  static double height = 1.0;
  static double width = 1.0;
  // ignore: prefer_const_constructors_in_immutables
  BaseViewWidget(
      {Key? key,
      this.appBar,
      this.bottomNavigationBar,
      required this.avoidScrollView,
      this.margin,
      this.body,
      this.fab})
      : super(key: key);

  static devLog(String statement) {
    log(statement);
    // ignore: avoid_print
    print(statement);
  }

  @override
  Widget build(BuildContext context) {
    // _call(context);
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return appBar != null
        ? Scaffold(
            floatingActionButton: fab,
            // resizeToAvoidBottomInset: false,
            bottomNavigationBar: bottomNavigationBar,
            appBar: appBar,
            // backgroundColor: MarkaColors.black,
            body: SafeArea(
              child: Container(
                margin: margin ?? EdgeInsets.symmetric(horizontal: 10.w),
                height: 1.sh,
                width: 1.sw,
                child: avoidScrollView
                    ? body
                    : CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: body ?? Container(),
                          ),
                        ],
                      ),
              ),
            ),
          )
        : SafeArea(
            child: Scaffold(
              floatingActionButton: fab,

              // resizeToAvoidBottomInset: false,
              bottomNavigationBar: bottomNavigationBar,

              // backgroundColor: MarkaColors.black,
              body: Container(
                margin: margin ?? EdgeInsets.symmetric(horizontal: 20.w),
                height: 1.sh,
                width: 1.sw,
                child: avoidScrollView
                    ? body
                    : CustomScrollView(
                        slivers: [
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: body ?? Container(),
                          ),
                        ],
                      ),
              ),
            ),
          );
  }
}
