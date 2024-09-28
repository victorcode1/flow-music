import 'package:flow_music/pages/radio/controller/controller_radio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FromRadio extends ConsumerStatefulWidget {
  final Map<String, dynamic>? data;
  final String? id;
  const FromRadio({super.key, this.data, this.id});

  @override
  ConsumerState<FromRadio> createState() => _FromRadioState();
}

class _FromRadioState extends ConsumerState<FromRadio> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(controllerRadio)
          .initFrom(data: widget.data, id: widget.id)
          .then((c) => setState(() {}));
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(controllerRadio);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close)),
          backgroundColor: Colors.transparent,
          title: const Text('Agregar Radio')),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
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
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Column(
                      children: [
                        Text('Imagen de la radio'),
                        GestureDetector(
                          onTap: () => controller.getImage(),
                          child: (controller.urlImage == null ||
                                  controller.urlImage == '')
                              ? controller.image == null
                                  ? Icon(Icons.image, size: 100)
                                  : Image.file(controller.image!, height: 200)
                              : Image.network(controller.urlImage!,
                                  height: 200),
                        ),
                        TextButton(
                            onPressed: () => controller.getImage().then(
                                  (value) => setState(() {}),
                                ),
                            child: Text('Seleccionar',
                                style: TextStyle(color: Colors.black)))
                      ],
                    ),
                  )),
            ],
          ),
        ),
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
