import 'package:flutter_music/mvp/base/base.dart';
  
abstract class IMainPagePresenter<V extends IMainPageView> extends BasePresenter<V> {}
  
abstract class IMainPageView implements IView {}