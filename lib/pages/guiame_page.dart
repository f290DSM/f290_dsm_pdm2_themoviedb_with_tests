import 'dart:developer';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../model/event_data_model.dart';

class EventosArtefatos extends StatefulWidget {
  const EventosArtefatos({super.key});

  @override
  State<EventosArtefatos> createState() => _EventosArtefatosState();
}

class _EventosArtefatosState extends State<EventosArtefatos> {
  final uriWebSocket =
      'ws://guiame-api.3far1ivu8btka.us-east-1.cs.amazonlightsail.com/evento/ws/1';
  late WebSocketChannel channel;

  @override
  void initState() {
    channel = WebSocketChannel.connect(Uri.parse(uriWebSocket));
    super.initState();
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  List<EventDataModel> events = List.generate(
      10,
      (index) => EventDataModel(
          title: faker.animal.name(),
          body: faker.lorem.sentences(3).toString()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Events')),
      body: SingleChildScrollView(child: _createList(events)),
    );
  }

  Widget _createList(List<EventDataModel> events) {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          events[panelIndex].isExpanded = !isExpanded;
        });
      },
      children: events.map<ExpansionPanel>((event) {
        return ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(event.title),
            );
          },
          body: ListTile(
            subtitle: Text(event.body),
          ),
          isExpanded: event.isExpanded,
        );
      }).toList(),
    );
  }
}

class ListaEventosWidget extends StatefulWidget {
  const ListaEventosWidget({super.key, required this.eventList});

  final List<EventDataModel> eventList;

  @override
  State<ListaEventosWidget> createState() => _ListaEventosWidgetState();
}

class _ListaEventosWidgetState extends State<ListaEventosWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          widget.eventList[panelIndex].isExpanded = !isExpanded;
        });
      },
      children: widget.eventList.map((event) {
        return ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(event.title),
            );
          },
          body: ListTile(
            subtitle: Text(event.body),
          ),
          isExpanded: event.isExpanded,
        );
      }).toList(),
    );
  }
}

/*
treamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: const SizedBox(
                  height: 200,
                  width: 200,
                  child: Center(child: CircularProgressIndicator())),
            );
          }

          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.hasData) {
            print(snapshot.data);
            log(snapshot.data);
            return Text(snapshot.data);
          }

          return Center(child: (const Text('Sem dados no momento.')));
        },
      ),
 */
