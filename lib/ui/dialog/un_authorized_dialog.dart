import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/color_constants.dart';
import '../../constants/routes_constants.dart';
import '../../constants/string_constant.dart';
import '../../utils/get_x_storage.dart';


class UnAuthorizedDialog extends StatelessWidget {
  const UnAuthorizedDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Container(
      padding: EdgeInsets.only(
          top: 0.05.sh, left: 0.05.sw, right: 0.05.sw, bottom: 0.05.sh),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(0.10.sw))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            StringConstants.alert,
            style: TextStyle(fontSize: 20.sp,color: ColorConstants.cEE2929),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          Center(
            child: Text(
              StringConstants.unauthenticatedDes,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          SizedBox(
            height: 0.03.sh,
          ),
          InkWell(
            onTap: () {
              GetXStorage().clearData();
              Get.offAllNamed(RoutesConstants.splash);
              // goToNavPage();
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  StringConstants.ok,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp,color: Colors.green),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
