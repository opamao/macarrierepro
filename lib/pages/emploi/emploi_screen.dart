import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:macarrierepro/custome/custome_appbar.dart';
import 'package:macarrierepro/pages/emploi/emploi_detail_screen.dart';
import 'package:macarrierepro/pages/emploi/emploi_model.dart';
import 'package:macarrierepro/utils/colors.dart';
import 'package:macarrierepro/utils/constance.dart';
import 'package:http/http.dart' as http;

class EmploiScreen extends StatefulWidget {
  const EmploiScreen({super.key});

  @override
  State<EmploiScreen> createState() => _EmploiScreenState();
}

class _EmploiScreenState extends State<EmploiScreen> {

  String formatDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(dateTime);
  }

  Future<List<Emplois>> fetchData() async {
    String? url = Constance.emploi;

    var isRedirect = true;

    while (isRedirect) {
      final client = http.Client();
      final request = http.Request('GET', Uri.parse(url!))
        ..followRedirects = false
        ..headers['cookie'] = 'security=true';
      print(request.headers);
      final response = await client.send(request);

      if (response.statusCode == HttpStatus.movedTemporarily) {
        isRedirect = response.isRedirect;
        url = response.headers['location'];
      } else if (response.statusCode == HttpStatus.ok) {
        final String responseBody = await response.stream.bytesToString();
        final List<dynamic> jsonResponse = json.decode(responseBody);
        return jsonResponse.map((data) => Emplois.fromJson(data)).toList();
      } else {
        throw Exception("An error occurred");
      }
    }

    throw Exception("No valid response received");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarCustome(title: "Emploi"),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<Emplois>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsEmploi(
                                emploi: snapshot.data![index],
                              ),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Gap(5),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: snapshot
                                              .data![index]
                                              .eEmbedded!
                                              .wpFeaturedmedia!
                                              .single
                                              .sourceUrl !=
                                          null
                                      ? Image.network(
                                          snapshot.data![index].eEmbedded!
                                              .wpFeaturedmedia!.single.sourceUrl!,
                                          fit: BoxFit.contain,
                                          height: 50,
                                        )
                                      : Image.asset(
                                          "assets/images/logo.png",
                                          fit: BoxFit.contain,
                                          height: 50,
                                          width: 50,
                                        ),
                                ),
                                const Gap(5),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Gap(5),
                                      SizedBox(
                                        child: HtmlWidget(
                                          snapshot.data![index].title!.rendered!,
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      const Gap(15),
                                      SizedBox(
                                        child: HtmlWidget(
                                          snapshot
                                              .data![index].excerpt!.rendered!,
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.pin_outlined,
                                        size: 15,
                                        color: bleu,
                                      ),
                                      const Text(
                                        "103311",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.event_available_outlined,
                                        size: 15,
                                        color: bleu,
                                      ),
                                      Text(
                                        formatDate(snapshot.data![index].dateGmt!),
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.event_busy_outlined,
                                        size: 15,
                                        color: bleu,
                                      ),
                                      Text(
                                        formatDate(snapshot.data![index].dateGmt!),
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 15,
                                        color: bleu,
                                      ),
                                      Text(
                                        "Côte d'I...",
                                        style: TextStyle(
                                          color: bleu,
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              debugPrint(snapshot.error.toString());
              return Text(snapshot.error.toString());
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      )),
    );
  }
}
