import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.23,
      width: size.width,
      color: bannerColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "NEW COLLECTIONS",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: -1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Row(
                  children: [
                    Text(
                      "20",
                      style: TextStyle(
                        fontSize: 40,
                        height: 0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: -3,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "%",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                            letterSpacing: 3,
                          ),
                        ),
                        Text(
                          "OFF",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            height: 0.6,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.black,
                  child: const Text(
                    'SHOP NOW',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/images/banner_image.png",
                width: size.width * 0.4,
                height: size.height * 0.2,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
