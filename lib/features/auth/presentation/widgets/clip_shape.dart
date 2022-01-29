import 'package:flutter/material.dart';
import 'package:my_ecommerce/features/auth/presentation/widgets/widgets.dart';

class _ClipShape extends StatelessWidget {
  const _ClipShape({Key? key, required this.centeredWidget}) : super(key: key);
  final Widget centeredWidget;

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            /// Custom Shape Clipper background.
            clipper: CustomShapeClipper(),
            child: Container(
              height: _height / 3.75,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade200, Colors.yellow.shade900],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            /// Custom Shape Clipper2 background.
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _height / 4.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade200, Colors.yellow.shade900],
                ),
              ),
            ),
          ),
        ),

        /// centered main widget.
        centeredWidget,

        Row(
          children: <Widget>[
            IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  print("pop");
                  Navigator.of(context).pop();
                })
          ],
        ),
      ],
    );
  }
}

class LoginClipShape extends StatelessWidget {
  const LoginClipShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ClipShape(
      centeredWidget: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10),
        child: Hero(
          tag: 'splash-logo',
          child: Image.asset(
            'assets/images/shopping_cart_icon.png',
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}

class SignUpClipShape extends StatelessWidget {
  const SignUpClipShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ClipShape(
      centeredWidget: Container(
        height: MediaQuery.of(context).size.height / 5.5,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.10),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(1.0, 10.0),
                blurRadius: 20.0),
          ],
          color: Colors.white,
          shape: BoxShape.circle,
        ),

        /// GestureDetector for adding  a photo.
        child: GestureDetector(
            onTap: () {
              // TODO :: Adding Photo
              print('Adding photo');
            },
            child: Icon(
              Icons.add_a_photo,
              size: 33,
              color: Colors.blue[200],
            )),
      ),
    );
  }
}
