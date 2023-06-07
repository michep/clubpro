import 'package:clubpro/models/fileset.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

enum ImageFieldType {
  single,
  multiple,
}

class ImageField extends StatefulWidget {
  final FileSet fileset;
  final ImageFieldType type;
  final double dimention;

  const ImageField({
    required this.fileset,
    required this.type,
    required this.dimention,
    super.key,
  });

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case ImageFieldType.single:
        return single();
      case ImageFieldType.multiple:
        return multiple();
    }
  }

  Widget single() {
    return widget.fileset.isEmpty ? addSingleImageTile() : singleImageTile(widget.fileset.getFile(0));
  }

  Widget multiple() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...widget.fileset.map((e) => multipleImageTile(e)),
          addMultipleImageTile(),
        ],
      ),
    );
  }

  Widget addSingleImageTile() {
    return SizedBox.square(
      dimension: widget.dimention,
      child: InkWell(
        onTap: pickSinglePicture,
        child: const Icon(
          Icons.add_circle_outline_outlined,
          size: 48,
        ),
      ),
    );
  }

  Widget addMultipleImageTile() {
    return SizedBox.square(
      dimension: widget.dimention,
      child: InkWell(
        onTap: pickMultilplePictures,
        child: const Icon(
          Icons.add_circle_outline_outlined,
          size: 48,
        ),
      ),
    );
  }

  Widget imageTile(Future<DBFile?> futurefile) {
    return FutureBuilder<DBFile?>(
      future: futurefile,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done || !snapshot.hasData) return const SizedBox.shrink();
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.memory(snapshot.data!.data).image,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  Widget singleImageTile(Future<DBFile?> futurefile) {
    return FutureBuilder<DBFile?>(
      future: futurefile,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done || !snapshot.hasData) return const SizedBox.shrink();
        return SizedBox.square(
          dimension: widget.dimention,
          child: Stack(
            children: [
              imageTile(futurefile),
              Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  child: PopupMenuButton<String>(
                    itemBuilder: (context) {
                      return const [
                        PopupMenuItem(
                          value: 'change',
                          child: Text('Изменить картинку'),
                        ),
                        PopupMenuItem(
                          value: 'clear',
                          child: Text('Убрать картинку'),
                        ),
                      ];
                    },
                    onSelected: (value) {
                      if (value == 'change') pickSinglePicture();
                      if (value == 'clear') clearSinglePicture();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget multipleImageTile(Future<DBFile> futurefile) {
    return FutureBuilder<DBFile>(
      future: futurefile,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done || !snapshot.hasData) return const SizedBox.shrink();
        return SizedBox.square(
          dimension: widget.dimention,
          child: Stack(
            children: [
              imageTile(futurefile),
              Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  child: IconButton(
                    onPressed: () => removeFromMultipePictures(snapshot.data!.id),
                    icon: const Icon(Icons.delete),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> pickSinglePicture() async {
    var res = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
    if (res != null && res.count == 1) {
      widget.fileset.addSingle(res.files[0].name, res.files[0].bytes!);
      setState(() {});
    }
  }

  Future<void> clearSinglePicture() async {
    if (widget.fileset.isNotEmpty) {
      setState(() {
        widget.fileset.clear();
      });
    }
  }

  Future<void> pickMultilplePictures() async {
    var res = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
    if (res != null && res.count == 1) {
      setState(() {
        widget.fileset.add(res.files[0].name, res.files[0].bytes!);
      });
    }
  }

  Future<void> removeFromMultipePictures(String fileid) async {
    setState(() {
      widget.fileset.remove(fileid);
    });
  }
}
