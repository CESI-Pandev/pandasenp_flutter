import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:pandasenp_flutter/extensions/date_time.dart';
import 'package:pandasenp_flutter/model/ressource.dart';
import 'package:pandasenp_flutter/view/widgets/fade.dart';

class RessourceCardWidget extends StatelessWidget {
  final Ressource ressource;

  const RessourceCardWidget({super.key, required this.ressource});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ressource.title,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Text(
            ressource.userCreated.identifier,
            style: const TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: FadeWidget(
              child: Center(
                child: MarkdownWidget(
                  data: ressource.content,
                  physics: const NeverScrollableScrollPhysics(),
                  selectable: false,
                ),
              ),
            ),
          ),
          const Divider(),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${ressource.category.label} - ${ressource.type.label}',
                style: const TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              Text(
                ressource.dateCreated.toEuropeanDateTime(),
                style: const TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            ressource.status.name,
            style: const TextStyle(fontSize: 16.0, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
