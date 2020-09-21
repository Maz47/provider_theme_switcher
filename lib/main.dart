import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './themes/themes_notifier.dart';
import './themes/my_theme.dart';
import './themes/themes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => new ThemesNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemesNotifier>(context).currentTheme.themedata,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Provider"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: availabelThemes.length,
          itemBuilder: (BuildContext context, int index) {
            MyTheme theme = availabelThemes[index];
            return new MaterialButton(
              height: 75.0,
              onPressed: () =>
                  Provider.of<ThemesNotifier>(context, listen: false)
                      .updateTheme(theme),
              child: Text(
                theme.name,
                style: TextStyle(color: Colors.white),
              ),
              color: theme.themedata.primaryColor,
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Provider.of<ThemesNotifier>(context).currentTheme.themedata.primaryColor,
          hoverColor: Provider.of<ThemesNotifier>(context).currentTheme.themedata.accentColor,
          splashColor: Provider.of<ThemesNotifier>(context).currentTheme.themedata.accentColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => {},
        ),
      ),
    );
  }
}
