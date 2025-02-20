import 'package:flutter/material.dart';

class MenuItems {
  final  String title;
  final  String subTitle;
  final  String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon
  });
  
}

const appMenuItems = <MenuItems>[
  
  MenuItems(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
   MenuItems(
    title: 'Tarjetas',
    subTitle: 'Un ejemplo de tarjetas en Flutter',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItems(
    title: 'Progress Indicator',
    subTitle: 'Generales y controlados',
    link: '/progress_screen',
    icon: Icons.refresh_rounded,
  ),
  MenuItems(
    title: 'SnackBar y Dialog',
    subTitle: 'Indicadores en pantalla',
    link: '/snackbar_screen',
    icon: Icons.info_outline,
  ),
  // todo menu items animated_screen
  MenuItems(
    title: 'Animated container',
    subTitle: 'Stateful widget animado',
    link: '/animated_screen',
    icon: Icons.animation,
  ),
  MenuItems(
    title: 'UI Controls + Tiles',
    subTitle: 'Controles de usuario',
    link: '/ui_controls_screen',
    icon: Icons.settings,
  ),


];