import 'package:flutter/material.dart';
import 'package:trolly_revamp/data/deal_header_data.dart';
import 'package:trolly_revamp/data/offer_data.dart';
import 'package:trolly_revamp/presentation/widgets/deals_header.dart';
import 'package:trolly_revamp/presentation/widgets/offer_card.dart';

class DealCards {
  Widget buildDealsCard(int length) {
    return Column(
      children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                      margin:
                          const EdgeInsets.only(left: 24, right: 24, top: 24),
                      child: DealsHeader(dealHeaderData: dealHeader[index])),
                  Container(
                    height: 320,
                    padding: const EdgeInsets.only(left: 16),
                    child: buildCards(),
                  )
                ],
              );
            }),
      ],
    );
  }

  Widget buildCards() {
    return ListView.builder(
        itemCount: todaysOffer.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return OfferCard(offerData: todaysOffer[index]);
        });
  }
}
