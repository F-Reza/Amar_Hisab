import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class ServiceProvider extends ChangeNotifier {

  Future<void> dialCall(String number) async {
    final uri = Uri.parse('tel:$number');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Cannot launch call app';
    }
  }

  Future<void> sendSms(String number) async {
    final uri = Uri.parse('sms:$number');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Cannot launch message app';
    }
  }

  Future<void> sendMail(String mail) async {
    final uri = Uri.parse('mailto:$mail');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Cannot launch mail app';
    }
  }

  Future<void> webLink(String web) async {
    final uri = Uri.parse('https:$web');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Cannot launch browser';
    }
  }

  Future<void> openGoogleMaps(String address) async {

    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$address';

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not launch $googleUrl';
    }
  }


  Future<void> goToLocation(String location) async {
    String urlString = '';
    if (Platform.isAndroid) {
      urlString = 'geo:00?q=$location';
    } else if (Platform.isIOS) {
      urlString = 'https://maps.apple.com/q=$location';
    }

    final uri = Uri.parse(urlString);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Cannot launch map';
    }
  }



}