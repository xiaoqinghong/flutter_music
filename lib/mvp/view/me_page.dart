import 'package:flutter/material.dart';
import 'package:flutter_music/mvp/base/base.dart';
import 'package:flutter_music/mvp/contract/me_contract.dart';
import 'package:flutter_music/mvp/presenter/me_presenter_impl.dart';

class MePage extends StatefulWidget {
  @override
  State createState() => _MePageState();
}

class _MePageState extends BaseState<MePage, MePresenterImpl, IMeView>
    implements IMeView {
  @override
  initPresenter() {
    return MePresenterImpl();
  }

  @override
  Widget buildContent() {
    return new Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("我的"),
      ),
    );
  }

  @override
  void init() {}
}
