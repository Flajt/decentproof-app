import 'package:advanced_in_app_review/advanced_in_app_review.dart';

// There is no interface rn, as the advanced in app review is highly specific and covers a lot of things other review packages don't
// Also it should only be used in one place, so it's not really necessary to have an interface
class InAppReviewWrapper {
  static void requestReview() {
    AdvancedInAppReview()
        .setMinDaysBeforeRemind(7)
        .setMinDaysAfterInstall(2)
        .setMinLaunchTimes(2)
        .setMinSecondsBeforeShowDialog(5)
        .monitor();
  }
}
