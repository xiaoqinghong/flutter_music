import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music/widgetes/loading_dialog.dart';

///定义页面的基础方法
abstract class IView {
  void showMessage(String msg);

  void showLoading();

  void dismissLoading();
}

///定义逻辑层的基础方法
abstract class IPresenter<V extends IView> {
  void onAttachView(IView view);

  void onDetachView();
}

///逻辑层基类
///处理页面生命周期回调、提供网络请求取消等
abstract class BasePresenter<V extends IView> extends IPresenter<V> {
  ///用于操作页面的接口
  V _mView;

  ///用户取消网络请求，在页面销毁时会自动调用
  CancelToken _cancelToken = new CancelToken();

  @override
  void onAttachView(IView view) {
    this._mView = view;
  }

  @override
  void onDetachView() {
    _cancelToken.cancel("canceled");
    this._mView = null;
  }

  //获取CancelToken的引用
  CancelToken cancelToken() => _cancelToken;

  V getView() => _mView;
}

///页面状态基类。构建、更新、销毁页面
///集成loading
abstract class BaseState<T extends StatefulWidget, P extends IPresenter<V>,
    V extends IView> extends State<T> implements IView {
  P _mPresenter;
  bool _isLoading = false;

  P initPresenter();

  Widget buildContent();

  void init();

  @override
  void initState() {
    super.initState();
    _mPresenter = initPresenter();
    if (_mPresenter != null) {
      _mPresenter.onAttachView(this);
    }
    init();
  }

  @override
  void dispose() {
    super.dispose();
    if (_mPresenter != null) {
      _mPresenter.onDetachView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildContent(),
    );
  }

  @override
  void dismissLoading() {
    if (_isLoading && Navigator.canPop(context)) {
      Navigator.pop(context);
      _isLoading = false;
    }
  }

  @override
  void showLoading() {
    if (_isLoading) return;
    _isLoading = true;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return new LoadingDialog(text: "Loading...");
        });
  }

  @override
  void showMessage(String msg) {}

  P getPresenter() => _mPresenter;
}
