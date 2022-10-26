// ignore_for_file: unused_field, prefer_final_fields, empty_statements

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/providers/products_provider.dart';
import '../providers/product.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key key}) : super(key: key);
  static const routeName = '/edit-product';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    description: '',
    id: null,
    imageUrl: '',
    price: 0,
    title: '',
  );

  var _isInit = true;
  var _initValue = {
    'description': '',
    'imageUrl': '',
    'price': '',
    'title': '',
  };

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);

        _initValue = {
          'description': _editedProduct.description,
          'imageUrl': _editedProduct.imageUrl,
          'price': _editedProduct.price.toString(),
          'title': _editedProduct.title,
        };
      }

      _imageUrlController.text = _editedProduct.imageUrl;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode;
    _descriptionFocusNode;
    _imageUrlController;
    _imageUrlFocusNode;
    // TODO: implement dispose
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
          !_imageUrlController.text.startsWith('https'))) {
        return;
      }
      ;
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (isValid) {
      return;
    }
    _form.currentState.save();
    if (_editedProduct.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
    } else {
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        actions: [
          IconButton(
            onPressed: _saveForm,
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextFormField(
                initialValue: _initValue['title'],
                decoration: InputDecoration(labelText: "Title"),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please provide a value";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _editedProduct = Product(
                      description: _editedProduct.description,
                      id: _editedProduct.id,
                      isFavorite: _editedProduct.isFavorite,
                      imageUrl: _editedProduct.imageUrl,
                      price: _editedProduct.price,
                      title: newValue);
                },
              ),
              TextFormField(
                initialValue: _initValue['price'],
                decoration: InputDecoration(labelText: "Price"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_descriptionFocusNode),
                onSaved: (newValue) {
                  _editedProduct = Product(
                      description: _editedProduct.description,
                      id: _editedProduct.id,
                      isFavorite: _editedProduct.isFavorite,
                      imageUrl: _editedProduct.imageUrl,
                      price: double.parse(newValue),
                      title: _editedProduct.title);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please provide a price";
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a Valid Number';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Change the price';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _initValue['description'],
                decoration: InputDecoration(labelText: "Description"),
                maxLines: 3,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (newValue) {
                  _editedProduct = Product(
                    description: newValue,
                    imageUrl: _editedProduct.imageUrl,
                    price: _editedProduct.price,
                    title: _editedProduct.title,
                    id: _editedProduct.id,
                    isFavorite: _editedProduct.isFavorite,
                  );
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "Please provide a Description";
                  }
                  if (value.length < 10) {
                    return 'Should be 10 characters long';
                  }

                  return null;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: Container(
                      child: _imageUrlController.text.isEmpty
                          ? Text("Enter a URL")
                          : FittedBox(
                              child: Image.network(_imageUrlController.text),
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNode,
                      onFieldSubmitted: (_) => _saveForm(),
                      onSaved: (newValue) {
                        _editedProduct = Product(
                          description: _editedProduct.description,
                          imageUrl: newValue,
                          price: _editedProduct.price,
                          title: _editedProduct.title,
                          id: _editedProduct.id,
                          isFavorite: _editedProduct.isFavorite,
                        );
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Please provide a Image";
                        }
                        if (!value.startsWith('http') &&
                            !value.startsWith('https')) {
                          return "Please provide a valid Url";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
