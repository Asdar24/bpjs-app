import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var color1 = Color(0xff1F469F);

class detail extends StatelessWidget {
  detail({
    Key? key,
    this.title1,
    this.title,
    this.color,
    this.image,
  }) : super(key: key);

  var title;
  var title1;
  var color;

  var image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: true
                  ? AssetImage(image)
                  : NetworkImage("assets/images/banner1.png") as ImageProvider),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 6,
                offset: Offset(1, 1))
          ]),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                "Selanjutnya >",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 2),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class buttonmenu extends StatelessWidget {
  buttonmenu({
    Key? key,
    this.titlebutton,
  }) : super(key: key);

  var titlebutton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: 50,
      decoration:
          BoxDecoration(color: color1, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titlebutton,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

class modelpesan extends StatelessWidget {
  final nama;
  final nama2;
  const modelpesan({
    Key? key,
    required this.nama,
    required this.nama2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nama2,
          style: TextStyle(color: color1, fontWeight: FontWeight.bold),
        ),
        Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            height: 30,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: color1),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 6, 0, 0),
              child: Text(nama),
            )),
      ],
    );
  }
}


// class textfielform extends StatelessWidget {
//   textfielform({Key? key, this.nama}) : super(key: key);
//   var nama;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           nama,
//           style: TextStyle(color: color1, fontWeight: FontWeight.bold),
//         ),
//         Container(
//           margin: EdgeInsets.only(top: 5, bottom: 5),
//           height: 30,
//           child: TextField(
//               decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             contentPadding: EdgeInsets.symmetric(horizontal: 10),
//           )),
//         ),
//       ],
//     );
//   }
// }
