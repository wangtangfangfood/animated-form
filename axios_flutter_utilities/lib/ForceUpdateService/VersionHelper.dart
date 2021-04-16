import 'dart:io';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:store_redirect/store_redirect.dart';

class VersionHelper {
  static String apkVersion;
  static String appName;

  static bool forceUpdate;

  static var androidAppId;
  static var iosAppId;

  static getVersion() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      Platform.isAndroid
          ? androidAppId = packageInfo.packageName
          : iosAppId = packageInfo.packageName;
      apkVersion = packageInfo.version;
      appName = packageInfo.appName ?? 'N/A';
    });
  }

  static changeUpdateStatus(value) => forceUpdate = !(apkVersion == value);

  static check(context) {
    Future.delayed(Duration(
      seconds: 4,
    )).then((value) {
      if (forceUpdate) updateDialog(context, appName);
    });
  }

  static updateDialog(context, appName) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        child: WillPopScope(
          onWillPop: () => Future.value(false),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: Platform.isAndroid
                ? Row(
                    children: <Widget>[
                      Image.asset('assets/updateIcons/google_play.png',
                          height: 25, width: 25),
                      Text('Google Play')
                    ],
                  )
                : Column(children: <Widget>[
                    Image.asset('assets/updateIcons/app_store.png',
                        height: 60, width: 60),
                    Text('App Store')
                  ]),
            content: Container(
              height: MediaQuery.of(context).size.height * .20,
              width: MediaQuery.of(context).size.width * .8,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Update " + appName + '...?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10.0),
                    Flexible(
                      child: Text(
                        ' $appName recommends that you update to latest version. You cannot continue to use the app without updating',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                    color: Colors.green[500],
                    onPressed: () {
                      StoreRedirect.redirect(
                          androidAppId: androidAppId, iOSAppId: iosAppId);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12),
                      child: Text("Update"),
                    )),
              )
            ],
            // actions: <Widget>[
            //   Ink(
            //     child: InkWell(
            //         onTap: () {
            //           // StoreRedirect.redirect(
            //           //     androidAppId: androidAppId, iOSAppId: iosAppId);
            //         },
            //         child: Text('Update')),
            //   )
            // ],
          ),
        ));
  }
}
