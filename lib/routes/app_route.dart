import 'package:get/get_navigation/get_navigation.dart';
import 'package:kalmanprojects/features/auth/login/screen/login_screen.dart';
import 'package:kalmanprojects/features/auth/sign_up/screen/sign_up_screen.dart';
import 'package:kalmanprojects/features/home/screen/home_screen.dart';
import 'package:kalmanprojects/features/inbox/screen/inbox_screen.dart';
import 'package:kalmanprojects/features/jobs/screen/jobs_screen.dart';
import 'package:kalmanprojects/features/jobs/screen/post_job_screen.dart';
import 'package:kalmanprojects/features/jobs/screen/post_job_screen_part2.dart';
import 'package:kalmanprojects/features/jobs/screen/post_job_screen_part3.dart';
import 'package:kalmanprojects/features/messages/screen/messages_screen.dart';
import 'package:kalmanprojects/features/myjobs/screen/myjobs_screen.dart';
import 'package:kalmanprojects/features/overview/screen/overview_screen.dart';
import 'package:kalmanprojects/features/profile/screen/profile_screen.dart';
import 'package:kalmanprojects/features/proposal/screen/proposal_screen.dart';
import 'package:kalmanprojects/features/services/screen/services_screen.dart';
import 'package:kalmanprojects/features/settings/screen/settings_screen.dart'
    as user_settings;
import 'package:kalmanprojects/features/splash_screen.dart/screen/splash_screen.dart';
import 'package:kalmanprojects/features/tradesman_profile/screen/tradesman_profile_screen.dart';
import 'package:kalmanprojects/features/tradesman_profile/screen/reviews_screen.dart';
import 'package:kalmanprojects/features/tradesman_profile/screen/payments_screen.dart';
import 'package:kalmanprojects/features/tradesman_profile/screen/settings_screen.dart'
    as tradesman_settings;

class Approute {
  static String splashScreen = '/splashScreen';
  static String loginScreen = '/loginScreen';
  static String signUpScreen = '/signUpScreen';
  static String homeScreen = '/homeScreen';
  static String jobsScreen = '/jobs';
  static String postJobScreen = '/postJob';
  static String postJobScreenPart2 = '/postJobPart2';
  static String postJobScreenPart3 = '/postJobPart3';
  static String servicesScreen = '/services';
  static String profileScreen = '/profile';
  static String tradesmanProfileScreen = '/tradesmanProfile';
  static String reviewsScreen = '/reviews';
  static String paymentsScreen = '/payments';
  static String overviewScreen = '/overview';
  static String myJobsScreen = '/myjobs';
  static String proposalScreen = '/proposal';
  static String messagesScreen = '/messages';
  static String inboxScreen = '/inbox';
  static String settingsScreen = '/settings';
  static String tradesmanSettingsScreen = '/tradesmanSettings';

  static String getSplashScreen() => splashScreen;
  static String getLoginScreen() => loginScreen;
  static String getSignUpScreen() => signUpScreen;
  static String getHomeScreen() => homeScreen;
  static String getJobsScreen() => jobsScreen;
  static String getPostJobScreen() => postJobScreen;
  static String getPostJobScreenPart2() => postJobScreenPart2;
  static String getPostJobScreenPart3() => postJobScreenPart3;
  static String getServicesScreen() => servicesScreen;
  static String getProfileScreen() => profileScreen;
  static String getTradesmanProfileScreen() => tradesmanProfileScreen;
  static String getReviewsScreen() => reviewsScreen;
  static String getPaymentsScreen() => paymentsScreen;
  static String getOverviewScreen() => overviewScreen;
  static String getMyJobsScreen() => myJobsScreen;
  static String getProposalScreen() => proposalScreen;
  static String getMessagesScreen() => messagesScreen;
  static String getInboxScreen() => inboxScreen;
  static String getSettingsScreen() => settingsScreen;
  static String getTradesmanSettingsScreen() => tradesmanSettingsScreen;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: jobsScreen,
      page: () => JobsScreen(),
    ),
    GetPage(
      name: postJobScreen,
      page: () => PostJobScreen(),
      popGesture: false,
    ),
    GetPage(
      name: postJobScreenPart2,
      page: () => PostJobScreenPart2(),
      popGesture: false,
    ),
    GetPage(
      name: postJobScreenPart3,
      page: () => PostJobScreenPart3(),
      // transition: Transition.rightToLeft,
      popGesture: false,
    ),
    GetPage(
      name: servicesScreen,
      page: () => ServicesScreen(),
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: tradesmanProfileScreen,
      page: () => TradesmanProfileScreen(),
    ),
    GetPage(
      name: reviewsScreen,
      page: () => ReviewsScreen(),
    ),
    GetPage(
      name: paymentsScreen,
      page: () => PaymentsScreen(),
    ),
    GetPage(
      name: overviewScreen,
      page: () => OverviewScreen(),
    ),
    GetPage(
      name: myJobsScreen,
      page: () => MyJobsScreen(),
    ),
    GetPage(
      name: proposalScreen,
      page: () => ProposalScreen(),
    ),
    GetPage(
      name: messagesScreen,
      page: () => MessagesScreen(),
    ),
    GetPage(
      name: inboxScreen,
      page: () => InboxScreen(),
    ),
    GetPage(
      name: settingsScreen,
      page: () => user_settings.SettingsScreen(),
    ),
    GetPage(
      name: tradesmanSettingsScreen,
      page: () => tradesman_settings.SettingsScreen(),
      // transition: Transition.rightToLeft,
    ),
  ];
}
