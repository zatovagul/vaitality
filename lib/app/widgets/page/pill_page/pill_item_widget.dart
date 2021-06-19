import 'package:flutter/material.dart';
import 'package:vaitality/app/constants/app_colors.dart';
import 'package:vaitality/app/constants/app_sizes.dart';
import 'package:vaitality/app/constants/app_textstyles.dart';
import 'package:vaitality/app/data/models/pill_item_model.dart';
import 'package:vaitality/app/widgets/small_widgets/galochka_widget.dart';

class PillItemWidget extends StatelessWidget {
  final PillItemModel model;
  final bool checked, isEdit;
  final VoidCallback onPressed;

  const PillItemWidget({Key? key,required this.model, this.checked:false, this.isEdit:false,required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            height: AppSizes.w1 * 66,
            color: model.isInjected ? null : AppColors.white,
            child: TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.w1 * 37),
                child: Row(
                  children: [
                    if(isEdit)
                    ...[CustomRadioWidget(checked: checked,), SizedBox(width: AppSizes.w1 * 7,)],
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.name, style: AppTextStyles.black15_w500
                            .copyWith(decoration: model.isInjected ? TextDecoration.lineThrough : null),),
                          Text(model.note, style: AppTextStyles.black14_w300
                              .copyWith(decoration: model.isInjected ? TextDecoration.lineThrough : null),),
                        ],
                      ),
                    ),
                    if(!isEdit)
                    GalochkaWidget(checked: model.isInjected,)
                  ],
                ),
              ),
            ),
          ),
          Container(height: AppSizes.w1 * 0.5, color: AppColors.grey,)
        ],
      ),
    );
  }
}
