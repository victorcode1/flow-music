import 'package:flow_music/pages/radio/controller/controller_radio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FromRadio extends ConsumerWidget {
  const FromRadio({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(controllerRadio);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close)),
          backgroundColor: Colors.transparent,
          title: const Text('Agregar Radio')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: TextField(
                  controller: controller.nameRadioController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Nombre de la radio',
                    labelText: 'Nombre de la radio',
                    labelStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintStyle: const TextStyle(color: Colors.grey),
                    alignLabelWithHint: true,
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: TextField(
                  controller: controller.urlRadioController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Url de la radio',
                      labelText: 'Url de la radio',
                      labelStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintStyle: const TextStyle(color: Colors.grey),
                      alignLabelWithHint: true),
                ),
              )),
          const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: Column(
                  children: [
                    Text('Imagen de la radio'),
                    Icon(Icons.image, size: 100),
                    TextButton(onPressed: null, child: Text('Seleccionar'))
                  ],
                ),
              )),
        ],
      ),
      floatingActionButton: TextButton(
          onPressed: () => controller.guardarRadio(context: context),
          child: const Text(
            'Guardar',
            style: TextStyle(color: Colors.black),
          )),
    );
  }
}
