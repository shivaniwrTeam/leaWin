import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimBtn extends StatelessWidget {
  final String? title;
  final VoidCallback? onBtnSelected;
  double? size;
  double? height;
  double? paddingvalue;
  Color? backgroundColor, borderColor, titleFontColor;
  double? borderWidth, borderRadius;

  SimBtn({
    Key? key,
    this.title,
    this.onBtnSelected,
    this.size,
    this.height,
    this.titleFontColor,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.paddingvalue,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width * size!;
    return _buildBtnAnimation(context);
  }

  Widget _buildBtnAnimation(BuildContext context) {
    return CupertinoButton(
      padding: paddingvalue != null ? EdgeInsets.all(paddingvalue!) : null,
      child: Container(
        width: size,
        height: height ?? 35,
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.onSecondary,
                Theme.of(context).colorScheme.onSecondaryContainer
              ],
              stops: [
                0,
                1
              ]),
          color: backgroundColor ?? Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.all(
            Radius.circular(
              borderRadius ?? 0.0,
            ),
          ),
          border: Border.all(
            width: borderWidth ?? 0,
            color: borderColor ?? Colors.transparent,
          ),
        ),
        child: Text(
          title!,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color:
                    titleFontColor ?? Theme.of(context).colorScheme.onSecondary,
                fontWeight: FontWeight.normal,
                fontFamily: 'ubuntu',
              ),
        ),
      ),
      onPressed: () {
        onBtnSelected!();
      },
    );
  }
}

// appbtn

class LoginButtons extends StatelessWidget {
  final String? label;
  final Color textColour;
  final Color boxColor;
  final Widget? widgets;
  final Function onpressfunction;
  const LoginButtons(
      {Key? key,
      this.label,
      required this.textColour,
      required this.boxColor,
      required this.onpressfunction,
      this.widgets})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 15, horizontal: 0),
      onPressed: () => onpressfunction(),
      child: Container(
          // padding: EdgeInsets.zero,
          // width: 90,
          height: 50,
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
              color: boxColor,
              boxShadow: [
                BoxShadow(
                    color: boxColor.withValues(alpha: 0.5),
                    blurRadius: 9.0,
                    spreadRadius: 2),
              ],
              borderRadius: BorderRadius.circular(50)),
          child: label != null
              ? Text(
                  label!,
                  style: TextStyle(
                    color: textColour,
                    fontFamily: 'ubuntu',
                  ),
                )
              : widgets),
    );
  }
}

class AppBtn extends StatelessWidget {
  final String? title;
  final AnimationController? btnCntrl;
  final Animation? btnAnim;
  final VoidCallback? onBtnSelected;
  final bool removeTopPadding;

  const AppBtn({
    Key? key,
    this.title,
    this.btnCntrl,
    this.btnAnim,
    this.onBtnSelected,
    this.removeTopPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final initialWidth = btnAnim!.value;
    return AnimatedBuilder(
      builder: (c, child) => _buildBtnAnimation(
        c,
        child,
        initialWidth: 0.3,
      ),
      animation: btnCntrl!,
    );
  }

  Widget _buildBtnAnimation(BuildContext context, Widget? child,
      {required double initialWidth}) {
    return CupertinoButton(
      padding: EdgeInsetsDirectional.only(
        top: removeTopPadding ? 0 : 25,
        start: 0,
        end: 0,
      ),
      child: Container(
          height: 50,
          alignment: FractionalOffset.center,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              boxShadow: [
                BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.5),
                    blurRadius: 9.0,
                    spreadRadius: 2),
              ],
              borderRadius: BorderRadius.circular(50)),
          child: Text(
            title!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'ubuntu',
                ),
          )),
      onPressed: () {
        //if it's not loading do the thing
        if (btnAnim!.value == initialWidth) {
          onBtnSelected!();
        }
      },
    );
  }
}
