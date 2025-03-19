import 'package:flutter/material.dart';
import 'package:flutterquiz/utils/constants/fonts.dart';
import 'package:flutterquiz/utils/extensions.dart';
import 'package:flutterquiz/utils/ui_utils.dart';
import 'package:intl/intl.dart';

class UserAchievements extends StatelessWidget {
  const UserAchievements({
    super.key,
    this.userRank = '0',
    this.userCoins = '0',
    this.userScore = '0',
  });

  final String userRank;
  final String userCoins;
  final String userScore;

  static const _verticalDivider = Divider(
    color: Color(0x99FFFFFF),
    indent: 12,
    endIndent: 14,
    thickness: 1,
  );

  @override
  Widget build(BuildContext context) {
    final rank = context.tr('rankLbl')!;
    final coins = context.tr('coinsLbl')!;
    final score = context.tr('scoreLbl')!;

    return LayoutBuilder(
      builder: (_, constraints) {
        final size = context;
        final numberFormat = NumberFormat.compact();

        return Stack(
          children: [
            Positioned(
              top: 0,
              left: constraints.maxWidth * (0.05),
              right: constraints.maxWidth * (0.05),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 25),
                      blurRadius: 30,
                      spreadRadius: 3,
                      color:
                          Theme.of(context).primaryColor.withValues(alpha: 0.5),
                    ),
                  ],
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(constraints.maxWidth * (0.525)),
                  ),
                ),
                width: constraints.maxWidth,
                height: 100,
              ),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 12.5,
                horizontal: 20,
              ),
              margin: EdgeInsets.symmetric(
                vertical: size.height * UiUtils.vtMarginPct,
                horizontal: size.width * UiUtils.hzMarginPct,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _Achievement(
                    title: rank,
                    value: numberFormat.format(double.parse(userRank)),
                  ),
                  _verticalDivider,
                  _Achievement(
                    title: coins,
                    value: numberFormat.format(double.parse(userCoins)),
                  ),
                  _verticalDivider,
                  _Achievement(
                    title: score,
                    value: numberFormat.format(double.parse(userScore)),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Achievement extends StatelessWidget {
  const _Achievement({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeights.bold,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),
        const Padding(
            padding: EdgeInsets.symmetric(
          vertical: 12.5,
          horizontal: 20,
        )),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeights.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
