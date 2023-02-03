import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // var height = paintWidthWithTextStyle(const TextStyle(fontSize: 20,fontWeight: FontWeight.w600));
    //
    //  print('--------height:$height');

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        textExceedMaxLines(
            '大家先看gif图，如果是自己想要的效果就可以往下面看了，不是想要的效果的话，就点赞离开',
            const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            4,
            double.infinity);
      },
    );
  }

  double paintWidthWithTextStyle(TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(
            text:
                'Automatically signing iOS for device deployment for device deployment',
            style: style),
        maxLines: 2,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size.height;
  }

  bool textExceedMaxLines(
      String text, TextStyle textStyle, int maxLine, double maxWidth) {
    TextSpan textSpan = TextSpan(text: text, style: textStyle);
    TextPainter textPainter = TextPainter(
        text: textSpan, maxLines: maxLine, textDirection: TextDirection.ltr);
    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);
    if (kDebugMode) {
      print(textPainter.height);
    }
    if (textPainter.didExceedMaxLines) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return const Text(
      '大家先看gif图，如果是自己想要的效果就可以往下面看了，不是想要的效果的话，就点赞离开',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }
}
