library r_order_apis;

import 'dart:convert';

import 'package:http/http.dart';

import 'models/cancel_order/cancel_order_model.dart';
import 'models/get_order/order_model.dart';
import 'models/get_sub_status/status_model.dart';
import 'models/message_model.dart';
import 'models/search_order/pagination_request_model.dart';
import 'models/search_order/search_order_model.dart';
import 'models/search_order/sort_model.dart';
import 'models/update_order_delivery/update_order_delivery_model.dart';
import 'models/update_order_memo/update_order_memo_model.dart';
import 'models/update_order_orderer/update_order_orderer_model.dart';
import 'models/update_order_remarks/update_order_remarks_model.dart';
import 'models/update_order_sender/update_order_sender_model.dart';
import 'models/update_order_shipping/result_shipping_model.dart';
import 'models/update_order_shipping/update_order_shipping_model.dart';
import 'models/update_order_sub_status/update_order_sub_status_model.dart';
import 'src/auth.dart';
import 'src/exceptions.dart';

class ROrderApis {
  ROrderApis({required String serviceSecret, required String licenseKey})
      : _getHeader =
            getJsonHeader(serviceSecret: serviceSecret, licenseKey: licenseKey);

  final Map<String, String> _getHeader;

  /// 指定された範囲の注文番号を取得
  Future<List<String>> searchOrder({
    required SearchOrderModel searchOrderModel,
  }) async {
    const endPoint = "https://api.rms.rakuten.co.jp/es/2.0/order/searchOrder/";
    List<String> result = [];
    try {
      final response = await post(Uri.parse(endPoint),
          headers: _getHeader, body: json.encode(searchOrderModel.toMap()));
      httpStatusValidation(response.statusCode);
      Map<String, dynamic> resBody = json.decode(response.body);
      if (resBody.containsKey("orderNumberList")) {
        if (resBody["orderNumberList"] != null) {
          List<dynamic> oderNumberList =
              resBody["orderNumberList"] as List<dynamic>;
          result = [for (var onum in oderNumberList) onum.toString()];
        }
      }
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// 指定された範囲のすべての注文番号を取得
  Future<List<String>> searchOrderAll({
    required SearchOrderModel searchOrderModel,
  }) async {
    const endPoint = "https://api.rms.rakuten.co.jp/es/2.0/order/searchOrder/";

    List<String> result = [];
    try {
      int pageIndex = 1;
      PaginationRequestModel paginationRequestModel = PaginationRequestModel(
          requestRecordsAmount: 1000,
          requestPage: pageIndex,
          sortModelList: SortModel(sortColumn: 1, sortDirection: 2));
      searchOrderModel.paginationRequestModel = paginationRequestModel;
      do {
        searchOrderModel.changePage(pageIndex);
        final response = await post(Uri.parse(endPoint),
            headers: _getHeader, body: json.encode(searchOrderModel.toMap()));
        httpStatusValidation(response.statusCode);
        Map<String, dynamic> resBody = json.decode(response.body);
        if (resBody.containsKey("orderNumberList")) {
          List<dynamic> oderNumberList =
              resBody["orderNumberList"] as List<dynamic>;
          result.addAll([for (var onum in oderNumberList) onum.toString()]);
        }
        if (resBody.containsKey("PaginationResponseModel")) {
          Map<String, dynamic> pagenationResponse =
              resBody["PaginationResponseModel"] as Map<String, dynamic>;
          if (pagenationResponse.containsKey("totalPages")) {
            if (int.parse(pagenationResponse["totalPages"].toString()) >
                pageIndex) {
              pageIndex++;
            } else {
              break;
            }
          }
        }
      } while (true);
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// 指定された注文番号の注文情報を取得
  Future<List<OrderModel>> getOrder(List<String> orderNumbers) async {
    const endPoint = "https://api.rms.rakuten.co.jp/es/2.0/order/getOrder/";
    List<OrderModel> result = [];
    try {
      List<List<String>> sliced = [];
      int count = 0;
      do {
        sliced.add(orderNumbers.skip(count).take(100).toList());
        count += 100;
      } while (count < orderNumbers.length);

      List<Map<String, dynamic>> resOrders = [];
      for (List<String> orderNums in sliced) {
        Map<String, Object> body = {
          "orderNumberList": orderNums,
          "version": 8,
        };
        final response = await post(Uri.parse(endPoint),
            headers: _getHeader, body: json.encode(body));
        httpStatusValidation(response.statusCode);
        Map<String, dynamic> resBody = json.decode(response.body);
        if (resBody.containsKey("OrderModelList")) {
          var res = [
            for (dynamic e in resBody["OrderModelList"])
              e as Map<String, dynamic>
          ];
          resOrders.addAll(res);
        }
      }
      for (var resOrder in resOrders) {
        result.add(OrderModel.fromJson(resOrder));
      }
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// 楽天ペイ注文の「注文確認」を行うことができます。こちらは同期処理となります。
  Future<List<MessageModel>> confirmOrder(List<String> orderNumbers) async {
    const endPoint = "https://api.rms.rakuten.co.jp/es/2.0/order/confirmOrder/";
    List<MessageModel> resultList = [];
    try {
      List<List<String>> sliced = [];
      int count = 0;
      do {
        sliced.add(orderNumbers.skip(count).take(100).toList());
        count += 100;
      } while (count < orderNumbers.length);

      for (var orderNumberList in sliced) {
        final response = await post(Uri.parse(endPoint),
            headers: _getHeader,
            body: json.encode({"orderNumberList": orderNumberList}));
        httpStatusValidation(response.statusCode);
        Map<String, dynamic> resBody = json.decode(response.body);
        if (resBody.containsKey("MessageModelList")) {
          resultList.addAll([
            for (var e in resBody["MessageModelList"])
              MessageModel.fromJson(e as Map<String, dynamic>)
          ]);
        }
      }
      return resultList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// 楽天ペイ注文の「発送情報の追加・更新」を行うことができます。こちらは同期処理となります。
  Future<List<MessageModel>> updateOrderShipping(
      UpdateOrderShippingModel model) async {
    const endPoint =
        "https://api.rms.rakuten.co.jp/es/2.0/order/updateOrderShipping/";
    List<MessageModel> resultList = [];
    try {
      final response = await post(Uri.parse(endPoint),
          headers: _getHeader, body: json.encode(model.toMap()));
      httpStatusValidation(response.statusCode);
      Map<String, dynamic> resBody = json.decode(response.body);
      if (resBody.containsKey("MessageModelList")) {
        resultList = [
          for (var e in resBody["MessageModelList"])
            MessageModel.fromJson(e as Map<String, dynamic>)
        ];
      }
      return resultList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// 楽天ペイ注文の「発送情報の追加・更新」を行うことができます。こちらは非同期処理となります。
  Future<List<MessageModel>> updateOrderShippingAsync(
      List<UpdateOrderShippingModel> models) async {
    const endPoint =
        "https://api.rms.rakuten.co.jp/es/2.0/order/updateOrderShippingAsync/";
    List<MessageModel> resultList = [];
    try {
      List<List<UpdateOrderShippingModel>> sliced = [];
      int count = 0;
      do {
        sliced.add(models.skip(count).take(100).toList());
        count += 100;
      } while (count < models.length);
      for (List<UpdateOrderShippingModel> modelList in sliced) {
        final response = await post(Uri.parse(endPoint),
            headers: _getHeader,
            body: json.encode({
              "OrderShippingModelList": [
                for (UpdateOrderShippingModel model in modelList) model.toMap()
              ]
            }));
        httpStatusValidation(response.statusCode);
        Map<String, dynamic> resBody = json.decode(response.body);
        if (resBody.containsKey("MessageModelList")) {
          resultList.addAll([
            for (var e in resBody["MessageModelList"])
              MessageModel.fromJson(e as Map<String, dynamic>)
          ]);
        }
      }
      return resultList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// 楽天ペイ注文の「発送完了報告（非同期）」処理の結果を確認することができます。こちらは同期処理となります。
  Future<List<ResultShippingModel>> getResultUpdateOrderShippingAsync(
      String requestId) async {
    const endPoint =
        "https://api.rms.rakuten.co.jp/es/2.0/order/getResultUpdateOrderShippingAsync/";
    List<ResultShippingModel> resultList = [];
    try {
      final response = await post(Uri.parse(endPoint),
          headers: _getHeader, body: json.encode({"requestId": requestId}));
      httpStatusValidation(response.statusCode);
      Map<String, dynamic> resBody = json.decode(response.body);
      if (resBody.containsKey("ResultShippingModelList")) {
        List<Map<String, dynamic>> resBodyCast = ([
          for (dynamic e in resBody["ResultShippingModelList"])
            e as Map<String, dynamic>
        ]);
        for (var element in resBodyCast) {
          element["MessageModelList"] = ([
            for (dynamic e in element["MessageModelList"])
              e as Map<String, dynamic>
          ]);
          resultList.add(ResultShippingModel(
              orderNumber: element["orderNumber"] ?? "None",
              messageModelList: element["MessageModelList"]));
        }
      }
      return resultList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// 店舗様が設定したサブステータスの一覧を取得することができます。
  Future<List<StatusModel>> getSubStatusList() async {
    const endPoint =
        "https://api.rms.rakuten.co.jp/es/2.0/order/getSubStatusList/";
    List<StatusModel> result = [];
    try {
      final response = await post(
        Uri.parse(endPoint),
        headers: _getHeader,
      );
      httpStatusValidation(response.statusCode);
      Map<String, dynamic> resBody = json.decode(response.body);
      if (resBody.containsKey("StatusModelList")) {
        result = [
          for (var e in resBody["StatusModelList"]) StatusModel.fromJson(e)
        ];
      }
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  ///
  Future<List<MessageModel>> updateOrderSubStatus(
      UpdateOrderSubStatusModel model) async {
    const endPoint =
        "https://api.rms.rakuten.co.jp/es/2.0/order/updateOrderSubStatus/";
    List<MessageModel> result = [];
    try {
      for (Map<String, dynamic> modelMap in model.toMapList()) {
        final response = await post(
          Uri.parse(endPoint),
          headers: _getHeader,
          body: json.encode(modelMap),
        );
        httpStatusValidation(response.statusCode);
        Map<String, dynamic> resBody = json.decode(response.body);
        if (resBody.containsKey("MessageModelList")) {
          List<MessageModel> messegeModelList = [
            for (var e in resBody["MessageModelList"])
              MessageModel.fromJson(e as Map<String, dynamic>)
          ];
          result.addAll(messegeModelList);
        }
      }
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<MessageModel>> updateOrderMemo(UpdateOrderMemoModel model) async {
    const endPoint =
        "https://api.rms.rakuten.co.jp/es/2.0/order/updateOrderMemo/";
    List<MessageModel> result = [];
    try {
      final response = await post(
        Uri.parse(endPoint),
        headers: _getHeader,
        body: json.encode(model.toMap()),
      );
      httpStatusValidation(response.statusCode);
      Map<String, dynamic> resBody = json.decode(response.body);
      if (resBody.containsKey("MessageModelList")) {
        List<MessageModel> messegeModelList = [
          for (var e in resBody["MessageModelList"])
            MessageModel.fromJson(e as Map<String, dynamic>)
        ];
        result.addAll(messegeModelList);
      }
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<MessageModel>> updateOrderRemarks(
      UpdateOrderRemarksModel model) async {
    const endPoint =
        "https://api.rms.rakuten.co.jp/es/2.0/order/updateOrderRemarks/";
    List<MessageModel> result = [];
    try {
      final response = await post(
        Uri.parse(endPoint),
        headers: _getHeader,
        body: json.encode(model.toMap()),
      );
      httpStatusValidation(response.statusCode);
      Map<String, dynamic> resBody = json.decode(response.body);
      if (resBody.containsKey("MessageModelList")) {
        List<MessageModel> messegeModelList = [
          for (var e in resBody["MessageModelList"])
            MessageModel.fromJson(e as Map<String, dynamic>)
        ];
        result.addAll(messegeModelList);
      }
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// 発送前の楽天ペイ注文の「送付者情報、注文商品情報および支払方法の更新」を行うことができます。こちらは同期処理となります。
  ///
  /// 対象項目は以下となります。
  ///
  /// ・商品名
  /// ・商品番号
  /// ・項目・選択肢
  /// ・単価
  /// ・商品税率
  /// ・税（込・別）
  /// ・送料（無料・別）
  /// ・送料税率
  /// ・代引料
  /// ・代引料税率
  /// ・代引手数料込別
  /// ・ラッピング情報更新、削除（包装紙・リボン、ラッピング名、単価、税（込・別）、ラッピング税率）
  /// ・送付先 - 名前
  /// ・送付先 - フリガナ
  /// ・送付先 - 住所
  /// ・送付先 - 電話番号
  /// ・送付先 - のし
  /// ・送付先 - 数量
  /// ・送付先 - 在庫連動（商品設定に合わせる・在庫連動する・在庫連動しない）
  /// ・送付先 - 消費税（※2019年7月の増税対応以降は更新いただけない項目です。）
  /// ・送付先 - 送料
  /// ・システム連携用SKU番号
  /// ・SKU情報
  ///
  /// 次のステータスの注文にのみ有効です。
  /// ・100: 注文確認待ち
  /// ・200: 楽天処理中
  /// ・300: 発送待ち
  Future<List<MessageModel>> updateOrderSender(
      UpdateOrderSenderModel model) async {
    const endPoint =
        "https://api.rms.rakuten.co.jp/es/2.0/order/updateOrderSender/";
    List<MessageModel> result = [];
    try {
      final response = await post(
        Uri.parse(endPoint),
        headers: _getHeader,
        body: json.encode(model.toMap()),
      );
      httpStatusValidation(response.statusCode);
      Map<String, dynamic> resBody = json.decode(response.body);
      if (resBody.containsKey("MessageModelList")) {
        List<MessageModel> messegeModelList = [
          for (var e in resBody["MessageModelList"])
            MessageModel.fromJson(e as Map<String, dynamic>)
        ];
        result.addAll(messegeModelList);
      }
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// 発送後の楽天ペイ注文の「送付者情報、注文商品情報および支払方法の更新」を行うことができます。こちらは同期処理となります。
  /// 対象項目は以下となります。
  ///
  /// ・商品名
  /// ・商品番号
  /// ・項目・選択肢
  /// ・単価
  /// ・商品税率
  /// ・税（込・別）
  /// ・送料（無料・別）
  /// ・送料税率
  /// ・代引料
  /// ・代引料税率
  /// ・代引手数料込別
  /// ・ラッピング情報更新、削除（包装紙・リボン、ラッピング名、単価、税（込・別）、ラッピング税率）
  /// ・送付先 - 名前
  /// ・送付先 - フリガナ
  /// ・送付先 - 住所
  /// ・送付先 - 電話番号
  /// ・送付先 - のし
  /// ・送付先 - 数量
  /// ・送付先 - 在庫連動（商品設定に合わせる・在庫連動する・在庫連動しない）
  /// ・送付先 - 消費税（※2019年7月の増税対応以降は更新いただけない項目です。）
  /// ・送付先 - 送料
  /// ・システム連携用SKU番号
  /// ・SKU情報
  ///
  /// 次のステータスの注文にのみ有効です。
  /// ・500: 発送済
  /// ・600: 支払手続き中
  /// ・700: 支払手続き済
  Future<List<MessageModel>> updateOrderSenderAfterShipping(
      UpdateOrderSenderModel model) async {
    const endPoint =
        "https://api.rms.rakuten.co.jp/es/2.0/order/updateOrderSenderAfterShipping/";
    List<MessageModel> result = [];
    try {
      final response = await post(
        Uri.parse(endPoint),
        headers: _getHeader,
        body: json.encode(model.toMap()),
      );
      httpStatusValidation(response.statusCode);
      Map<String, dynamic> resBody = json.decode(response.body);
      if (resBody.containsKey("MessageModelList")) {
        List<MessageModel> messegeModelList = [
          for (var e in resBody["MessageModelList"])
            MessageModel.fromJson(e as Map<String, dynamic>)
        ];
        result.addAll(messegeModelList);
      }
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// 発送前の楽天ペイ注文のキャンセルを行うことができます。こちらは同期処理となります。
  /// 次のステータスの注文にのみ有効です。
  /// ・100: 注文確認待ち
  /// ・200: 楽天処理中
  /// ・300: 発送待ち
  Future<List<MessageModel>> cancelOrder(CancelOrderModel model) async {
    const endPoint = "https://api.rms.rakuten.co.jp/es/2.0/order/cancelOrder/";
    List<MessageModel> result = [];
    try {
      final response = await post(
        Uri.parse(endPoint),
        headers: _getHeader,
        body: json.encode(model.toMap()),
      );
      httpStatusValidation(response.statusCode);
      Map<String, dynamic> resBody = json.decode(response.body);
      if (resBody.containsKey("MessageModelList")) {
        List<MessageModel> messegeModelList = [
          for (var e in resBody["MessageModelList"])
            MessageModel.fromJson(e as Map<String, dynamic>)
        ];
        result.addAll(messegeModelList);
      }
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// 発送後の楽天ペイ注文の「キャンセル確定」を行うことができます。こちらは同期処理となります。
  /// 次のステータスの注文にのみ有効です。
  /// ・500: 発送済
  /// ・600: 支払手続き中
  /// ・700: 支払手続き済
  /// ・800: キャンセル確定待ち
  Future<List<MessageModel>> cancelOrderAfterShipping(
      CancelOrderModel model) async {
    const endPoint =
        "https://api.rms.rakuten.co.jp/es/2.0/order/cancelOrderAfterShipping/";
    List<MessageModel> result = [];
    try {
      final response = await post(
        Uri.parse(endPoint),
        headers: _getHeader,
        body: json.encode(model.toMap()),
      );
      httpStatusValidation(response.statusCode);
      Map<String, dynamic> resBody = json.decode(response.body);
      if (resBody.containsKey("MessageModelList")) {
        List<MessageModel> messegeModelList = [
          for (var e in resBody["MessageModelList"])
            MessageModel.fromJson(e as Map<String, dynamic>)
        ];
        result.addAll(messegeModelList);
      }
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// 楽天ペイ注文の「注文者情報の更新」を行うことができます。こちらは同期処理となります。
  /// 注文者情報の対象項目は以下となります。
  /// ・注文者 - 名前
  /// ・注文者 - フリガナ
  /// ・注文者 - 住所
  /// ・注文者 - 電話番号
  /// ・注文者 - メールアドレス
  /// ・注文者 - 性別
  /// ・注文者 - 誕生日
  Future<List<MessageModel>> updateOrderOrderer(
      UpdateOrderOrdererModel model) async {
    const endPoint =
        "https://api.rms.rakuten.co.jp/es/2.0/order/updateOrderOrderer/";
    List<MessageModel> result = [];
    try {
      final response = await post(
        Uri.parse(endPoint),
        headers: _getHeader,
        body: json.encode(model.toMap()),
      );
      httpStatusValidation(response.statusCode);
      Map<String, dynamic> resBody = json.decode(response.body);
      if (resBody.containsKey("MessageModelList")) {
        List<MessageModel> messegeModelList = [
          for (var e in resBody["MessageModelList"])
            MessageModel.fromJson(e as Map<String, dynamic>)
        ];
        result.addAll(messegeModelList);
      }
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// 楽天ペイ注文の「配送方法の更新」を行うことができます。こちらは同期処理となります。
  Future<List<MessageModel>> updateOrderDelivery(
      UpdateOrderDeliveryModel model) async {
    const endPoint =
        "https://api.rms.rakuten.co.jp/es/2.0/order/updateOrderDelivery/";
    List<MessageModel> result = [];
    try {
      final response = await post(
        Uri.parse(endPoint),
        headers: _getHeader,
        body: json.encode(model.toMap()),
      );
      httpStatusValidation(response.statusCode);
      Map<String, dynamic> resBody = json.decode(response.body);
      if (resBody.containsKey("MessageModelList")) {
        List<MessageModel> messegeModelList = [
          for (var e in resBody["MessageModelList"])
            MessageModel.fromJson(e as Map<String, dynamic>)
        ];
        result.addAll(messegeModelList);
      }
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
