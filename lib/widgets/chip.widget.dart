import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RokeChip extends StatelessWidget {
  const RokeChip(
      {super.key,
      this.isLocalUrl = false,
      required this.uri,
      this.localArguments,
      this.icon,
      required this.s});
  final bool? isLocalUrl;
  final String uri;
  final Object? localArguments;
  final Widget? icon;
  final String s;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () async {
          if (isLocalUrl!) {
            Navigator.pushNamedAndRemoveUntil(context, uri, (route) => false,
                arguments: localArguments);
            return;
          } else if (!await launchUrl(
            Uri.parse(uri),
            mode: LaunchMode.inAppWebView,
            webViewConfiguration: const WebViewConfiguration(
                enableDomStorage: true, enableJavaScript: true),
          )) {
            throw Exception('Could not launch $uri');
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              color: const Color(0xffFF7A00),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              icon!,
              const SizedBox(
                width: 5,
              ),
              Text(
                s.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
