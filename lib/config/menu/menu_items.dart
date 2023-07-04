import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon
  });
}

const appMenuItems = <MenuItem>[

  MenuItem(
    title: 'Riverpod Counter', 
    subTitle: 'Contador con Provider', 
    link: '/counter', 
    icon: Icons.add_circle_outline
  ),
  
  MenuItem(
    title: 'Botones', 
    subTitle: 'Ejemplos de botones', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: 'Tarjetas', 
    subTitle: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card
  ),

  MenuItem(
    title: 'ProgressIndicator', 
    subTitle: 'Generales y controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),

  MenuItem(
    title: 'Snackbars & dialogs', 
    subTitle: 'Indicadores de estado', 
    link: '/snackbar', 
    icon: Icons.info_outline
  ),

  MenuItem(
    title: 'Animated Container', 
    subTitle: 'Statefull widget animado', 
    link: '/animated', 
    icon: Icons.animation
  ),

  MenuItem(
    title: 'UI Controls + Tiles', 
    subTitle: 'Una serie de controles', 
    link: '/ui_controls', 
    icon: Icons.control_point
  ),

  MenuItem(
    title: 'Introduccion de la APP', 
    subTitle: 'Pequeño tutorial de la APP', 
    link: '/app_tutorial', 
    icon: Icons.integration_instructions
  ),

  MenuItem(
    title: 'InfiniteScroll y Pull', 
    subTitle: 'Scroll infinito y pull to refresh', 
    link: '/infinite_scroll', 
    icon: Icons.insights_sharp
  ),

  MenuItem(
    title: 'Cambiar thema de la APP', 
    subTitle: 'Cambiar el thema de la APP', 
    link: '/theme_changer', 
    icon: Icons.color_lens_outlined
  ),


];