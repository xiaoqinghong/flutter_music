import 'package:flutter_music/mvp/base/base.dart';
  
abstract class IMePresenter<V extends IMeView> extends BasePresenter<V> {}
  
abstract class IMeView implements IView {}