import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trolly_revamp/data/category.dart';
import 'package:trolly_revamp/data/deal_header_data.dart';
import 'package:trolly_revamp/data/offer_data.dart';
import 'package:trolly_revamp/functions/deal_cards.dart';
import 'package:trolly_revamp/presentation/bloc/tab_switch/tab_switch_bloc.dart';
import 'package:trolly_revamp/presentation/bloc/tab_switch/tab_switch_state.dart';
import 'package:trolly_revamp/presentation/pages/categories_screen.dart';
import 'package:trolly_revamp/presentation/pages/register_screen.dart';

import 'package:trolly_revamp/utils/constatnt.dart';
import 'package:trolly_revamp/presentation/widgets/bottom_nav.dart';
import 'package:trolly_revamp/presentation/widgets/category_panel.dart';
import 'package:trolly_revamp/presentation/widgets/deals_header.dart';
import 'package:trolly_revamp/presentation/widgets/language_translation_btn.dart';
import 'package:trolly_revamp/presentation/widgets/offer_card.dart';
import 'package:trolly_revamp/presentation/widgets/search_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void getRegisterPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => RegisterScreen(),
      ),
    );
  }

  DealCards dealCards = DealCards();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            buildAppHeaders(),
            const SearchBox(),
            Expanded(
              child: BlocBuilder<TabSwitchBloc, TabSwitchState>(
                builder: (BuildContext context, state) {
                  if (state is InitialTabState) {
                    final index = state.index;
                    if (index == 0) {
                      return ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Container(
                            height: 146,
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 20),
                            // color: Colors.amberAccent,
                            child: buildCategoriesPanel(),
                          ),
                          Container(
                            // color: Colors.amberAccent,
                            width: double.infinity,
                            child: dealCards.buildDealsCard(dealHeader.length),
                          ),
                        ],
                      );
                    } else if (index == 1) {
                      return CategoriesScreen();
                    }
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }

  static Widget buildAppHeaders() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LanguageTranslationButton(),
          Text(
            'Trolley',
            style: GoogleFonts.lemonada(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          InkWell(
            child: SvgPicture.asset(
              profile,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoriesPanel() {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryPanel.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CategoryPanel(
            categoryModel: categoryPanel[index],
          );
        },
      ),
    );
  }
}
