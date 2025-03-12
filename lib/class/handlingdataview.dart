import 'package:flutter/material.dart';
import 'package:newmanager/class/statusrequest.dart';

class Handlingdataview extends StatelessWidget {
  const Handlingdataview({
    super.key,
    required this.statusRequest,
    required this.widget,
  });
  final StatusRequest statusRequest;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: Text('loading'))
        : statusRequest == StatusRequest.offlinefailer
        ? const Center(child: Text('offlinefailer'))
        : statusRequest == StatusRequest.serverfailure
        ? const Center(child: Text('serverfailure'))
        : statusRequest == StatusRequest.faliure
        ? const Center(child: Text('faliure'))
        : widget;
  }
}
