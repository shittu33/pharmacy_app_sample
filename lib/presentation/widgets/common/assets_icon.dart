import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/app/assets.dart';

class AssetsSvg {
  AssetsSvg._();

  static Widget searchIcon = Assets.searchIcon.getSvg();
  static Widget catDotIcon = Assets.catDotIcon.getSvg();
  static Widget catIcon = Assets.catIcon.getSvg();
  static Widget dispenseIcon = Assets.dispenseIcon.getSvg();
  static Widget icon1pill = Assets.icon1pill.getSvg();
  static Widget icon2pill = Assets.icon2pill.getSvg();

  static Widget homeIcon({color}) => Assets.homeIcon.getSvg(color: color);

  static Widget communityIcon({color}) =>
      Assets.communityIcon.getSvg(color: color);

  static Widget doctorIcon({color}) => Assets.doctorIcon.getSvg(color: color);

  static Widget profileIcon({color}) => Assets.profileIcon.getSvg(color: color);

  static Widget pharmacyCartIcon({color}) =>
      Assets.pharmacyCartIcon.getSvgBlack(color: color);

  static Widget productIdIcon = Assets.productIdIcon.getSvg();
  static Widget deliveryIcon = Assets.deliveryIcon.getSvg();
}

extension AssetIconExt on String {
  Widget getSvg({color}) {
    return SvgPicture.asset(
      this,
      color: color,
    );
  }

  Widget getSvgSize({color}) {
    return SvgPicture.asset(
      this,
      color: color,
    );
  }

  Widget getSvgBlack({
    color,
  }) {
    return SvgPicture.asset(
      this,
      color: color ?? Colors.black38,
    );
  }
}
