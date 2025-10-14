import 'package:flow_music/home/repo/io_view_controller.dart';
import 'package:flutter/material.dart';

class HomeViewController {
  final IoViewController view;

  HomeViewController(this.view);

  factory HomeViewController.build({required IoViewController view}) {
    return HomeViewController(view);
  }

  Widget? buildView({
    required Widget Function(String data) view,
  }) {
    return view('data');
  }
}
