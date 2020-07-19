import 'package:flutter/material.dart';
import 'package:flutter_music/mvp/base/base.dart';
import 'package:flutter_music/mvp/contract/main_page_contract.dart';
import 'package:flutter_music/mvp/presenter/main_page_presenter_impl.dart';
import 'package:flutter_music/mvp/view/me_page.dart';
import 'package:flutter_music/mvp/view/scene_list_page.dart';

class MainPagePage extends StatefulWidget {
  @override
  State createState() => _MainPagePageState();
}

class _MainPagePageState
    extends BaseState<MainPagePage, MainPagePresenterImpl, IMainPageView>
    implements IMainPageView {
  int _mCurrentIndex = 0;
  List<Widget> _mPages = new List();

  @override
  initPresenter() {
    return MainPagePresenterImpl();
  }

  @override
  Widget buildContent() {
    return new Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottom(),
    );
  }

  @override
  void init() {
    this._mPages.add(SceneListPage());
    this._mPages.add(MePage());
    setState(() {
      this._mCurrentIndex = 0;
    });
  }

  Widget _buildBody() {
    return IndexedStack(index: _mCurrentIndex, children: _mPages);
  }

  Widget _buildBottom() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("home")),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("me")),
      ],
      currentIndex: _mCurrentIndex,
      onTap: (int index) {
        setState(() {
          this._mCurrentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}
