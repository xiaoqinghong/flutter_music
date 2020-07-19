import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_music/mvp/base/base.dart';
import 'package:flutter_music/mvp/contract/scene_list_contract.dart';
import 'package:flutter_music/mvp/presenter/scene_list_presenter_impl.dart';

class SceneListPage extends StatefulWidget {
  @override
  State createState() => _SceneListPageState();
}

class _SceneListPageState
    extends BaseState<SceneListPage, SceneListPresenterImpl, ISceneListView>
    implements ISceneListView {
  List<String> _items = [];

  @override
  initPresenter() {
    return SceneListPresenterImpl();
  }

  @override
  Widget buildContent() {
    return new Scaffold(
      backgroundColor: Colors.black26,
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return _buildItem(_items[index]);
        },
        itemCount: _items.length,
      ),
    );
  }

  @override
  void init() {
    this._items.add("I Love Flutter");
    this._items.add("I Love Flutter");
    this._items.add("I Love Flutter");
    this._items.add("I Love Flutter");
  }

  Widget _buildItem(String name) {
    return Container(
        alignment: Alignment.center,
        color: Colors.black12,
        margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        width: double.infinity,
        height: 200.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1595182064242&di=eab0eee2f16a135be5f740a5989d9430&imgtype=0&src=http%3A%2F%2Fimg2.sycdn.imooc.com%2F5dbf9ae90001ac8206000338.jpg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Opacity(
              opacity: 0.8,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.center,
                color: Colors.black,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Text(
                name,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ));
  }
}
