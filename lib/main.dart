import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var title = 'UK Flix';
    return new MaterialApp(
      title: title,
      home: new MyAppHomePage(),
    );
  }
}

class MyAppHomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

const String flutterUrl = "https://portfolio.uk-flix.win/Limaflix";
const String wikiUrl = "https://es.wikipedia.org";

class _MyAppState extends State<MyAppHomePage> {
  late WebViewController _controller;

  _back() async {
    if (await _controller.canGoBack()) {
      await _controller.goBack();
    }
  }

  _forward() async {
    if (await _controller.canGoForward()) {
      await _controller.goForward();
    }
  }

  _loadPage() async {
    var url = await _controller.currentUrl();
    _controller.loadUrl(
      url == "https://portfolio.uk-flix.win/Limaflix"
          ? 'https://es.wikipedia.org'
          : "https://portfolio.uk-flix.win/Limaflix",
    );

    print(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UK Flix'),
        actions: <Widget>[
          IconButton(
            onPressed: _back,
            icon: Icon(Icons.arrow_back_ios),
          ),
          IconButton(
            onPressed: _forward,
            icon: Icon(Icons.arrow_forward_ios),
          ),
          SizedBox(width: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadPage,
        child: Icon(Icons.refresh),
      ),
      body: SafeArea(
        child: WebView(
          key: Key("webview"),
          initialUrl: 'https://portfolio.uk-flix.win/Limaflix',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
        ),
      ),
    );
  }
}