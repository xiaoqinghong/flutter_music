import 'package:flutter_music/mvp/base/base.dart';
  
abstract class ISceneListPresenter<V extends ISceneListView> extends BasePresenter<V> {}
  
abstract class ISceneListView implements IView {}