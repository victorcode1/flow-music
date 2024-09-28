import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flow_music/core/const/roots/rutas.dart';
import 'package:flow_music/pages/radio/components/from_radio.dart';
import 'package:flow_music/pages/radio/controller/controller_radio.dart';
import 'package:flow_music/pages/radio/interface/radio_interface.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RadioList extends ConsumerStatefulWidget {
  const RadioList({super.key});

  @override
  ConsumerState<RadioList> createState() => _RadioListState();
}

class _RadioListState extends ConsumerState<RadioList>
    implements RadioInterface {
  @override
  Widget build(BuildContext context) {
    final controller = ref.read(controllerRadio)..buid(io: this);
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: controller.listRadio,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text('Error'));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('No hay datos'));
            }
            final dataList = snapshot.data?.docs.map((doc) {
                  final data = doc.data();
                  data['id'] = doc.id; // Incluir el docId en los datos
                  return data;
                }).toList() ??
                [];

            return GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: dataList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                final data = dataList[index];

                return Center(
                  child: InkWell(
                    onTap: () => context.pushNamed(
                        RutasShelf.radioRadioContent.name,
                        queryParameters: {
                          'url': data['url'],
                          'name': data['name']
                        }),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        StreamBuilder<bool>(
                            stream: controller.isAdmin(),
                            builder: (context, snapshot) {
                              return IgnorePointer(
                                ignoring: snapshot.data == false,
                                child: Opacity(
                                  opacity: snapshot.data == true ? 1 : 0,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                        onPressed: () => controller.editarRadio(
                                            id: data['id'], data: data),
                                        icon: const Icon(
                                          Icons.edit_note_rounded,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                              );
                            }),
                        ClipOval(
                          child: data['urlImage'] != ''
                              ? Image.network(
                                  data['urlImage'] ?? '',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Icon(
                                    Icons.radio,
                                    size: 100,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(data['name'] ?? '',
                              style: const TextStyle(color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: StreamBuilder<bool>(
          stream: controller.isAdmin(),
          builder: (context, snapshot) {
            return IgnorePointer(
              ignoring: snapshot.data == false,
              child: Opacity(
                  opacity: snapshot.data == true ? 1 : 0,
                  child: IconButton(
                      onPressed: () => controller.crearRadio(),
                      icon: const Icon(Icons.add))),
            );
          }),
    );
  }

  @override
  void showFrom({Map<String, dynamic>? data, String? id}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            content: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: FromRadio(data: data, id: id)),
          );
        });
  }
}
