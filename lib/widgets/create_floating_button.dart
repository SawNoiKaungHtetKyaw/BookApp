import 'package:bookapp/bloc/add_to_shelve_bloc.dart';
import 'package:bookapp/data/vos/shelves_vo/shelves_vo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/strings.dart';
import 'easy_text.dart';

class CreateNewFloatingActionButton extends StatelessWidget {
  const CreateNewFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return FloatingActionButton.extended(
      backgroundColor: kFavoriteColor,
      foregroundColor: kWhiteColor,
      onPressed: () async {
        await showAlertDialiog(context, _controller, _formKey, () {
          if (_formKey.currentState!.validate()) {
            Navigator.of(context).pop();
            ShelvesVo shelvesVo = ShelvesVo(
                DateTime.now().millisecondsSinceEpoch.toString(), _controller.text, []);
            context.read<AddToShelveBloc>().saveNewShelve(shelvesVo);
          }
        });
      },
      icon: const Icon(Icons.edit),
      label: const EasyText(
        text: kCreateNew,
        textColor: kWhiteColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Future showAlertDialiog(BuildContext context,
      TextEditingController controller, var formKey, Function onTap) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(kCreateNewShelve),
            content: Form(
              key: formKey,
              child: TextFormField(
                controller: controller,
                decoration: const InputDecoration(hintText: kEnterShelve),
                validator: (value) {
                  if (value!.isEmpty) {
                    return kErrorEnterShelve;
                  }
                  return null;
                },
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () => onTap(),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: kFavoriteColor),
                  child: const EasyText(
                    text: kCreateNew,
                    textColor: kWhiteColor,
                    fontWeight: FontWeight.bold,
                  )),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: kFavoriteColor),
                  child: const EasyText(
                    text: kCancel,
                    textColor: kWhiteColor,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          );
        });
    
  }
}
