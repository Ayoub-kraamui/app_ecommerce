import 'package:app_ecommerce/core/constant/approute.dart';
import 'package:app_ecommerce/core/middleware/mymiddleware.dart';
import 'package:app_ecommerce/view/address/add.dart';
import 'package:app_ecommerce/view/address/adddetails.dart';
import 'package:app_ecommerce/view/address/view.dart';
import 'package:app_ecommerce/view/screen/auth/forgetpassword.dart/forgetpassworde.dart';
import 'package:app_ecommerce/view/screen/auth/forgetpassword.dart/resatepassworde.dart';
import 'package:app_ecommerce/view/screen/auth/forgetpassword.dart/success_resatepassworde.dart';
import 'package:app_ecommerce/view/screen/auth/forgetpassword.dart/verfiycode.dart';
import 'package:app_ecommerce/view/screen/auth/login.dart';
import 'package:app_ecommerce/view/screen/auth/signup.dart';
import 'package:app_ecommerce/view/screen/auth/success_signup.dart';
import 'package:app_ecommerce/view/screen/auth/verifycode_signup.dart';
import 'package:app_ecommerce/view/screen/checkout.dart';
import 'package:app_ecommerce/view/screen/homescreen.dart';
import 'package:app_ecommerce/view/screen/cart.dart';
import 'package:app_ecommerce/view/screen/items.dart';
import 'package:app_ecommerce/view/screen/itemsdetails.dart';
import 'package:app_ecommerce/view/screen/language.dart';
import 'package:app_ecommerce/view/screen/myfavorite.dart';
import 'package:app_ecommerce/view/screen/onboarding.dart';
import 'package:app_ecommerce/view/screen/orders/archive_orders.dart';
import 'package:app_ecommerce/view/screen/orders/order_details.dart';
import 'package:app_ecommerce/view/screen/orders/order_traking.dart';
import 'package:app_ecommerce/view/screen/orders/panding_orders.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Lanuage(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.cart, page: () => const Cart()),

  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(
      name: AppRoute.forgetepassworde, page: () => const ForgetPasswordeAuth()),
  GetPage(name: AppRoute.verfiycode, page: () => const VerfiyCodeAuth()),
  GetPage(name: AppRoute.resatepassworde, page: () => const ResatePassworde()),
  GetPage(name: AppRoute.sucesssignup, page: () => const SuccessGoToSignUp()),
  GetPage(
      name: AppRoute.successresatepassworde,
      page: () => const SuccessResatePassword()),
  GetPage(
      name: AppRoute.verfiycodeSignUp,
      page: () => const VerfiyCodeSignUpAuth()),
  //app
  //GetPage(name: AppRoute.homepage, page: () => const Home()),
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.itemsdetails, page: () => const ItemsDetails()),
  GetPage(name: AppRoute.myfavorite, page: () => const MyFavorite()),
  //Address
  GetPage(name: AppRoute.addressadd, page: () => const AdressAdd()),
  GetPage(
      name: AppRoute.addressaddDetails, page: () => const AdressAddDetails()),
  GetPage(name: AppRoute.addressview, page: () => const AdressView()),
  GetPage(name: AppRoute.checkOut, page: () => const CheckOut()),
  //Orders
  GetPage(name: AppRoute.ordersPanding, page: () => const OrdersPanding()),
  GetPage(name: AppRoute.ordersArchive, page: () => const OrdersArchive()),
  GetPage(name: AppRoute.ordersDetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.ordersTracking, page: () => const OrdersTracking()),

  //Offers
  //GetPage(name: AppRoute.offers, page: () => const OffersView()),
];
