import '/flutter_flow/flutter_flow_util.dart';
import 'upload_document_widget.dart' show UploadDocumentWidget;
import 'package:flutter/material.dart';

class UploadDocumentModel extends FlutterFlowModel<UploadDocumentWidget> {
  ///  Local state fields for this component.

  List<FFUploadedFile> uploadedImageFiles = [];
  void addToUploadedImageFiles(FFUploadedFile item) =>
      uploadedImageFiles.add(item);
  void removeFromUploadedImageFiles(FFUploadedFile item) =>
      uploadedImageFiles.remove(item);
  void removeAtIndexFromUploadedImageFiles(int index) =>
      uploadedImageFiles.removeAt(index);
  void insertAtIndexInUploadedImageFiles(int index, FFUploadedFile item) =>
      uploadedImageFiles.insert(index, item);
  void updateUploadedImageFilesAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      uploadedImageFiles[index] = updateFn(uploadedImageFiles[index]);

  List<String> uploadedSupabaseUrl = [];
  void addToUploadedSupabaseUrl(String item) => uploadedSupabaseUrl.add(item);
  void removeFromUploadedSupabaseUrl(String item) =>
      uploadedSupabaseUrl.remove(item);
  void removeAtIndexFromUploadedSupabaseUrl(int index) =>
      uploadedSupabaseUrl.removeAt(index);
  void insertAtIndexInUploadedSupabaseUrl(int index, String item) =>
      uploadedSupabaseUrl.insert(index, item);
  void updateUploadedSupabaseUrlAtIndex(int index, Function(String) updateFn) =>
      uploadedSupabaseUrl[index] = updateFn(uploadedSupabaseUrl[index]);

  ///  State fields for stateful widgets in this component.

  bool isDataUploading_downloadDataImagepdf = false;
  List<FFUploadedFile> uploadedLocalFiles_downloadDataImagepdf = [];

  bool isDataUploading_uploadDataPdf = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataPdf = [];
  List<String> uploadedFileUrls_uploadDataPdf = [];

  bool isDataUploading_uploadDataUcz = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadDataUcz = [];
  List<String> uploadedFileUrls_uploadDataUcz = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
