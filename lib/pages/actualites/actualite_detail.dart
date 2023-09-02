import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:macarrierepro/pages/actualites/actualite_model.dart';
import 'package:macarrierepro/utils/colors.dart';

class DetailActualiteScreen extends StatefulWidget {
  Actualites actualite;

  DetailActualiteScreen({super.key, required this.actualite});

  @override
  State<DetailActualiteScreen> createState() => _DetailActualiteScreenState();
}

class _DetailActualiteScreenState extends State<DetailActualiteScreen> {
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
        title: Text(widget.actualite.title!.rendered!),
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
                  child: Image.network(
                    widget.actualite.yoastHeadJson!.ogImage!.first.url!,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: 300,
                  ),
                ),
                const Gap(10),
                Text(
                  "Publié le ${formatDate(widget.actualite.dateGmt!)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
                const Gap(10),
                SizedBox(
                  child: HtmlWidget(
                    widget.actualite.title!.rendered!,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const Gap(15),
                SizedBox(
                  child: HtmlWidget(
                    widget.actualite.content!.rendered!,
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
