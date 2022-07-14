import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("CustomLine"),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LineContainer()
          ],
        ),
      ),
    );
  }
}

class LineContainer extends StatefulWidget {
  const LineContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<LineContainer> createState() => _LineContainerState();
}

class _LineContainerState extends State<LineContainer> {

  double valueLine = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails update){
        setState((){
          valueLine = update.globalPosition.dx / (size.width);
        });
      },
      child: SizedBox(
        height: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color:  Colors.white,
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  stops: [valueLine,0],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.blue,
                    Color(0xfff0f3ff),
                  ],
                )

              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.keyboard_arrow_up_outlined,color: valueLine>0?Colors.grey.shade400:Colors.blue,size: 40,),
                  Icon(Icons.keyboard_arrow_down_outlined,color: valueLine>0.8?Colors.white:Colors.black,size: 40,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
