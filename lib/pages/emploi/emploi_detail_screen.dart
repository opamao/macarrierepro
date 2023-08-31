import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:macarrierepro/pages/emploi/emploi_model.dart';
import 'package:macarrierepro/utils/colors.dart';

class DetailsEmploi extends StatefulWidget {
  Emplois emploi;

  DetailsEmploi({
    super.key,
    required this.emploi,
  });

  @override
  State<DetailsEmploi> createState() => _DetailsEmploiState();
}

class _DetailsEmploiState extends State<DetailsEmploi> {
  String formatDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: principale.withOpacity(.2),
        title: Text(widget.emploi.title!.rendered!),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  child: widget.emploi.eEmbedded!.wpFeaturedmedia!.first
                              .sourceUrl !=
                          null
                      ? Image.network(
                          widget.emploi.eEmbedded!.wpFeaturedmedia!.first
                              .sourceUrl!,
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: 300,
                        )
                      : Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: 300,
                        ),
                ),
                const Gap(10),
                Text(
                  "Publié le ${formatDate(widget.emploi.dateGmt!)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
                const Gap(10),
                SizedBox(
                  child: HtmlWidget(
                    widget.emploi.title!.rendered!,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const Gap(15),
                SizedBox(
                  child: HtmlWidget(
                    widget.emploi.content!.rendered!,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
