import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterquiz/ui/widgets/ButtonDesing.dart';

class NoInterNet extends StatelessWidget {
  dynamic setStateNoInternate;
  Animation<dynamic>? buttonSqueezeanimation;
  AnimationController? buttonController;
  NoInterNet(
      {Key? key,
      required this.buttonController,
      required this.buttonSqueezeanimation,
      required this.setStateNoInternate})
      : super(key: key);

  Widget noIntImage() {
    return SvgPicture.asset(
      'no_internet',
      fit: BoxFit.contain,
    );
  }

  Widget noIntText(BuildContext context) {
    return Text(
      'NO_INTERNET',
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.normal,
            fontFamily: 'ubuntu',
          ),
    );
  }

  Widget noIntDec(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.only(top: 30.0, start: 30.0, end: 30.0),
      child: Text(
        'NO_INTERNET_DISC',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.normal,
              fontSize: 15,
              fontFamily: 'ubuntu',
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 23),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              noIntImage(),
              noIntText(context),
              noIntDec(context),
              AppBtn(
                title: 'TRY_AGAIN_INT_LBL',
                btnAnim: buttonSqueezeanimation,
                btnCntrl: buttonController,
              )
            ],
          ),
        ),
      ),
    );
  }
}
