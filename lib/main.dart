// import 'dart:async';
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:http/http.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   void initState() {
//     call();
//     super.initState();
//   }
//
//   Map<String, String> headers = {
//     "Content-Type": 'application/json',
//     'correlationId': '65b245b8-4732-4b9b-8206-41269d62d6b2',
//     'destination': 'MOM',
//     'operation': 'firstPaymentReceiptDownload',
//     'source': 'Selfcare',
//     'srDate': '2023-10-31 11:51:35',
//     'x-lang': 'en_us',
//     'token':
//         'eyJhbGciOiJIUzUxMiJ9.eyJ0ZW5hbnRUeXBlIjoiY2xpZW50IiwidGVuYW5jeUlkIjoiTVZOT19DU01BUlRHQV9CQU4iLCJsb2dpblVzZXJuYW1lIjoiQWRkUGxhbkludjc2MDciLCJsb2dpblR5cGUiOiJ1c2VybmFtZSIsImFwcElkIjoiMzljZGE5MDctNmEzMy0zNmZhLWE1MTEtNmI2Y2M3MTAyYzg4IiwiYWNjb3VudE5vIjoiMDFDMTM3NDQyIiwidG9rZW5UeXBlIjoidXNlclRva2VuIiwiZW1haWwiOiJhQGdtYWlsLmNvbSIsImlhdCI6MTY5ODc1NjY0MiwiZXhwIjoxNjk4NzY3NDQyfQ.VAmKSFtzNBv3u8xQsQq8vOLxWfAifwFwWcwU2RMIz6Vb8yAIEx1kvggzdXTZhZH26n9MC52jVmA9YLMv_z1dvw',
//   };
//   String url = 'http://182.18.131.164:8089/csmart-crmservices/crm/v1/customer/payment/receipt/download';
//   var pdfPath;
//
//   void call() async {
//     try {
//       Response response = await get(Uri.parse(url), headers: headers)
//           .timeout(Duration(seconds: 120));
//       if (response.statusCode == 200) {
//         await _savePDF(response.bodyBytes);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//   Uint8List? data;
//   String filePath = '/path/to/save/sample.txt';
//   _savePDF(Uint8List data) async {
//     try {
//       print(data);
//       setState(() {
//         this.data = data;
//         writeUint8ListToFile(data);
//       });
//     } catch (error) {
//       print("Error saving PDF: $error");
//     }
//   }
//   void writeUint8ListToFile(Uint8List data) {
//     print("writeUint8ListToFile is Called");
//     File file = File(filePath);
//     print("Step - 1");
//     file.writeAsBytesSync(data);
//     print('File saved at: $filePath');
//   }
//
//
//
//
//
//
//
//
//
//
//   String landscapePathPdf = "";
//   String remotePDFpath = "";
//   String corruptedPathPDF = "";
//   final Completer<PDFViewController> _controller =
//   Completer<PDFViewController>();
//   int? pages = 0;
//   int? currentPage = 0;
//   bool isReady = false;
//   String errorMessage = '';
//
//   @override
//   Widget build(BuildContext context) {
//     print("$filePath");
//     return Scaffold(
//           appBar: AppBar(
//             title: Text("PDF"),
//           ),
//           body:
//
//             SfPdfViewer.file(File(filePath)),
//
//           // PDFView(
//           //   filePath: filePath,
//           //   enableSwipe: true,
//           //   swipeHorizontal: true,
//           //   autoSpacing: false,
//           //   pageFling: true,
//           //   pageSnap: true,
//           //   defaultPage: currentPage!,
//           //   fitPolicy: FitPolicy.BOTH,
//           //   preventLinkNavigation:
//           //   false, // if set to true the link is handled in flutter
//           //   onRender: (_pages) {
//           //     setState(() {
//           //       pages = _pages;
//           //       isReady = true;
//           //     });
//           //   },
//           //   onError: (error) {
//           //     setState(() {
//           //       errorMessage = error.toString();
//           //     });
//           //     print(error.toString());
//           //   },
//           //   onPageError: (page, error) {
//           //     setState(() {
//           //       errorMessage = '$page: ${error.toString()}';
//           //     });
//           //     print('$page: ${error.toString()}');
//           //   },
//           //   onViewCreated: (PDFViewController pdfViewController) {
//           //     _controller.complete(pdfViewController);
//           //   },
//           //   onLinkHandler: (String? uri) {
//           //     print('goto uri: $uri');
//           //   },
//           //   onPageChanged: (int? page, int? total) {
//           //     print('page change: $page/$total');
//           //     setState(() {
//           //       currentPage = page;
//           //     });
//           //   },
//           // ),
//
//     );
//   }
// }
//
//
// class ShowPdf extends StatefulWidget {
//   ShowPdf(this.data, {Key? key,}) : super(key: key);
//    Uint8List data;
//   @override
//   State<ShowPdf> createState() => _ShowPdfState();
// }
//
// class _ShowPdfState extends State<ShowPdf> {
//   late PdfViewerController _pdfViewerController;
//   final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();
// @override
//   void initState() {
//   _pdfViewerController = PdfViewerController();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("PDF"),
//         ),
//         body:  SfPdfViewer.file(File.fromRawPath(widget.data))
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myflutterapp/page/pdf_viewer_page.dart';
import 'package:myflutterapp/widget/button_widget.dart';

import 'api/pdf_api.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'PDF Viewer';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primaryColor: Colors.blue,
    ),
    home: MainPage(),
  );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              text: 'Asset PDF',
              onClicked: () async {
                final path = 'assets/sample.pdf';
                // final file = await PDFApi.loadAsset(path);
                // openPDF(context, file);
              },
            ),
            const SizedBox(height: 16),
            ButtonWidget(
              text: 'File PDF',
              onClicked: () async {
                // final file = await PDFApi.pickFile();
                //
                // if (file == null) return;
                // openPDF(context, file);
              },
            ),
            const SizedBox(height: 16),
            ButtonWidget(
              text: 'Network PDF',
              onClicked: () async {
                final url =
                    'http://182.18.131.164:8089/csmart-crmservices/crm/v1/customer/payment/receipt/download';
                final file = await PDFApi.loadNetwork(url);
                openPDF(context, file);
              },
            ),
            const SizedBox(height: 16),
            ButtonWidget(
              text: 'Firebase PDF',
              onClicked: () async {
                final url = 'sample.pdf';
                // final file = await PDFApi.loadFirebase(url);

                // if (file == null) return;
                // openPDF(context, file);
              },
            ),
          ],
        ),
      ),
    ),
  );

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
  );
}
