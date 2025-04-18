import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/ui/views/account_details/controller/account_details_controller.dart';

void showEditImageModal({
  required BuildContext context,
  required VoidCallback onPickImageFromGallery,
  required VoidCallback onTakePhoto,
}) async {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r))),
    context: context,
    builder: (BuildContext context) {
      final controller = Get.put(AccountDetailsController());

      return SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r)),
            ),
            width: Get.width,
            padding: EdgeInsets.only(
                bottom: 20.h, top: 20.h, left: 10.w, right: 10.w),
            child: Wrap(
                alignment: WrapAlignment.start,
                runSpacing: 10.w,
                spacing: 10.w,
                children: controller.avatars.map((e) {
                  return GestureDetector(
                    onTap: () {
                      controller.uploadAvatarImage(e);
                      Get.back();
                    },
                    child: Image.network(
                      e,
                      height: 50,
                      width: 50,
                    ),
                  );
                }).toList())),
      );
    },
  );
}
