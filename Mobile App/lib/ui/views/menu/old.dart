// import 'package:flutter/material.dart';
// import 'package:healthcare_360_mobile/ui/base_view/base_view.dart';
// import 'package:healthcare_360_mobile/ui/views/menu/menu_viewmodel.dart';
// import 'package:healthcare_360_mobile/ui/widgets/menu_tile.dart';

// class MenuView extends StatelessWidget {
//   const MenuView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<MenuViewModel>(builder: (context, vm, child) {
//       return BaseViewWidget(
//         avoidScrollView: true,
//         body: Column(
//           children: [
//             Image.asset(
//               'assets/logo.png',
//               // scale: 0.25,
//               height: 200,
//             ),
//             SizedBox(
//               height: 25.h,
//             ),
//             const CustomText(
//               'Our Services',
//               style: TextStyles.m_29,
//               color: HcColors.purple,
//             ),
//             SizedBox(
//               height: 25.h,
//             ),
//             Expanded(
//               child: GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                       maxCrossAxisExtent: 200,
//                       // childAspectRatio: 3 / 2,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10),
//                   itemCount: vm.ourServices.length,
//                   itemBuilder: (BuildContext ctx, index) {
//                     return InkWell(
//                         onTap: () {
//                           if (vm.ourServices[index].route.isNotEmpty) {
//                             Get.toNamed(vm.ourServices[index].route);
//                           }
//                         },
//                         child: MenuTile(service: vm.ourServices[index]));
//                   }),
//             ),
//             SizedBox(
//               height: 25.h,
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
