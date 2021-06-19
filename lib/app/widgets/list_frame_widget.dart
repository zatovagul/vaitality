import 'package:flutter/material.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';

class ListFrameWidget extends StatelessWidget {
  final List<Widget> children;

  const ListFrameWidget({Key? key, required this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white
      ),
      child: Column(
        children: [
          Container(height: AppSizes.w1 * 0.7, color: AppColors.lightGrey,),
          for(int i =0;i<children.length;i++)
            Padding(
              padding: EdgeInsets.only(left: AppSizes.w1 * 16),
              child: Column(
                children: [
                  children[i],
                  if(i!=children.length-1)
                  Container(height: AppSizes.w1 * 0.5, color: AppColors.lightGrey,)
                ],
              ),
            ),
          Container(height: AppSizes.w1 * 0.7, color: AppColors.lightGrey,)
        ],
      ),
    );
  }
}
