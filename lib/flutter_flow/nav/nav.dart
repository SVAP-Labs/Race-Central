import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? LandingSplashScreenWidget()
          : Auth2LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? LandingSplashScreenWidget()
              : Auth2LoginWidget(),
        ),
        FFRoute(
          name: Auth2CreateWidget.routeName,
          path: Auth2CreateWidget.routePath,
          builder: (context, params) => Auth2CreateWidget(),
        ),
        FFRoute(
          name: Auth2LoginWidget.routeName,
          path: Auth2LoginWidget.routePath,
          builder: (context, params) => Auth2LoginWidget(),
        ),
        FFRoute(
          name: Auth2ForgotPasswordWidget.routeName,
          path: Auth2ForgotPasswordWidget.routePath,
          builder: (context, params) => Auth2ForgotPasswordWidget(),
        ),
        FFRoute(
          name: Auth2CreateProfileWidget.routeName,
          path: Auth2CreateProfileWidget.routePath,
          builder: (context, params) => Auth2CreateProfileWidget(),
        ),
        FFRoute(
          name: Auth2ProfileWidget.routeName,
          path: Auth2ProfileWidget.routePath,
          builder: (context, params) => Auth2ProfileWidget(),
        ),
        FFRoute(
          name: Auth2EditProfileWidget.routeName,
          path: Auth2EditProfileWidget.routePath,
          builder: (context, params) => Auth2EditProfileWidget(),
        ),
        FFRoute(
          name: UserHomePageWidget.routeName,
          path: UserHomePageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UserHomePageWidget(
            eventUID: params.getParam(
              'eventUID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LandingSplashScreenWidget.routeName,
          path: LandingSplashScreenWidget.routePath,
          builder: (context, params) => LandingSplashScreenWidget(),
        ),
        FFRoute(
          name: UserProfilePageWidget.routeName,
          path: UserProfilePageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UserProfilePageWidget(),
        ),
        FFRoute(
          name: UserEventsListPageWidget.routeName,
          path: UserEventsListPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => UserEventsListPageWidget(),
        ),
        FFRoute(
          name: KartingSealingWidget.routeName,
          path: KartingSealingWidget.routePath,
          builder: (context, params) => KartingSealingWidget(
            sealingid: params.getParam(
              'sealingid',
              ParamType.String,
            ),
            sealUniqueNumber: params.getParam(
              'sealUniqueNumber',
              ParamType.String,
            ),
            sealCategory: params.getParam(
              'sealCategory',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SealingSearchWidget.routeName,
          path: SealingSearchWidget.routePath,
          builder: (context, params) => SealingSearchWidget(),
        ),
        FFRoute(
          name: DriverScrutinycheckWidget.routeName,
          path: DriverScrutinycheckWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DriverScrutinycheckWidget(
            driverScrutinyID: params.getParam(
              'driverScrutinyID',
              ParamType.String,
            ),
            eventRegID: params.getParam(
              'eventRegID',
              ParamType.String,
            ),
            pCategory: params.getParam(
              'pCategory',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: KartScrutinycheckWidget.routeName,
          path: KartScrutinycheckWidget.routePath,
          requireAuth: true,
          builder: (context, params) => KartScrutinycheckWidget(
            kartScrutinyID: params.getParam(
              'kartScrutinyID',
              ParamType.String,
            ),
            eventRegistrationID: params.getParam(
              'eventRegistrationID',
              ParamType.String,
            ),
            driverScrutinyID: params.getParam(
              'driverScrutinyID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ScruitneerLandingWidget.routeName,
          path: ScruitneerLandingWidget.routePath,
          builder: (context, params) => ScruitneerLandingWidget(),
        ),
        FFRoute(
          name: EngineSealPageWidget.routeName,
          path: EngineSealPageWidget.routePath,
          builder: (context, params) => EngineSealPageWidget(
            sealingID: params.getParam(
              'sealingID',
              ParamType.String,
            ),
            category: params.getParam(
              'category',
              ParamType.String,
            ),
            sealUniqueNumber: params.getParam(
              'sealUniqueNumber',
              ParamType.String,
            ),
            paraSealRemarks: params.getParam(
              'paraSealRemarks',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SealSummaryPageWidget.routeName,
          path: SealSummaryPageWidget.routePath,
          builder: (context, params) => SealSummaryPageWidget(),
        ),
        FFRoute(
          name: TermsAndConditionsWidget.routeName,
          path: TermsAndConditionsWidget.routePath,
          builder: (context, params) => TermsAndConditionsWidget(),
        ),
        FFRoute(
          name: SportingSOMWidget.routeName,
          path: SportingSOMWidget.routePath,
          builder: (context, params) => SportingSOMWidget(
            eventUID: params.getParam(
              'eventUID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SportingLandingPageWidget.routeName,
          path: SportingLandingPageWidget.routePath,
          builder: (context, params) => SportingLandingPageWidget(),
        ),
        FFRoute(
          name: SealSummaryPageCopyWidget.routeName,
          path: SealSummaryPageCopyWidget.routePath,
          builder: (context, params) => SealSummaryPageCopyWidget(),
        ),
        FFRoute(
          name: WithADropPageWidget.routeName,
          path: WithADropPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => WithADropPageWidget(
            eventID: params.getParam(
              'eventID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MecoRegistrationWidget.routeName,
          path: MecoRegistrationWidget.routePath,
          builder: (context, params) => MecoRegistrationWidget(
            eventID: params.getParam(
              'eventID',
              ParamType.String,
            ),
            driverID: params.getParam(
              'driverID',
              ParamType.String,
            ),
            category: params.getParam(
              'category',
              ParamType.String,
            ),
            banner: params.getParam(
              'banner',
              ParamType.String,
            ),
            lateFeeDate: params.getParam(
              'lateFeeDate',
              ParamType.DateTime,
            ),
            eventpColour: params.getParam(
              'eventpColour',
              ParamType.String,
            ),
            eventpText: params.getParam(
              'eventpText',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SOMApprovedWidget.routeName,
          path: SOMApprovedWidget.routePath,
          builder: (context, params) => SOMApprovedWidget(
            applicationID: params.getParam(
              'applicationID',
              ParamType.String,
            ),
            eventUID: params.getParam(
              'eventUID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: OfEntryListPageWidget.routeName,
          path: OfEntryListPageWidget.routePath,
          builder: (context, params) => OfEntryListPageWidget(
            eventID: params.getParam(
              'eventID',
              ParamType.String,
            ),
            eventName: params.getParam(
              'eventName',
              ParamType.String,
            ),
            category: params.getParam(
              'category',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TrackdetailsWidget.routeName,
          path: TrackdetailsWidget.routePath,
          builder: (context, params) => TrackdetailsWidget(
            trackID: params.getParam(
              'trackID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SchedulePageWidget.routeName,
          path: SchedulePageWidget.routePath,
          builder: (context, params) => SchedulePageWidget(
            eventName: params.getParam(
              'eventName',
              ParamType.String,
            ),
            eventID: params.getParam(
              'eventID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RegulationsPageWidget.routeName,
          path: RegulationsPageWidget.routePath,
          builder: (context, params) => RegulationsPageWidget(
            championshipId: params.getParam(
              'championshipId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: NoticeBoardPageWidget.routeName,
          path: NoticeBoardPageWidget.routePath,
          builder: (context, params) => NoticeBoardPageWidget(
            eventId: params.getParam(
              'eventId',
              ParamType.String,
            ),
            eventName: params.getParam(
              'eventName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RaceResultsWidget.routeName,
          path: RaceResultsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RaceResultsWidget(
            eventID: params.getParam(
              'eventID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: StreamingPageWidget.routeName,
          path: StreamingPageWidget.routePath,
          builder: (context, params) => StreamingPageWidget(
            eventID: params.getParam(
              'eventID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LiveTimingViewWidget.routeName,
          path: LiveTimingViewWidget.routePath,
          builder: (context, params) => LiveTimingViewWidget(
            eventID: params.getParam(
              'eventID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: IameRegistrationWidget.routeName,
          path: IameRegistrationWidget.routePath,
          builder: (context, params) => IameRegistrationWidget(
            eventID: params.getParam(
              'eventID',
              ParamType.String,
            ),
            driverID: params.getParam(
              'driverID',
              ParamType.String,
            ),
            category: params.getParam(
              'category',
              ParamType.String,
            ),
            banner: params.getParam(
              'banner',
              ParamType.String,
            ),
            lateFeeDate: params.getParam(
              'lateFeeDate',
              ParamType.DateTime,
            ),
            eventpColour: params.getParam(
              'eventpColour',
              ParamType.String,
            ),
            eventpText: params.getParam(
              'eventpText',
              ParamType.String,
            ),
            paymentQR: params.getParam(
              'paymentQR',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/Login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/SplashScreen.png',
                    fit: BoxFit.fill,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
