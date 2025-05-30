import 'package:fmlfantasy/core/config/global_instances.dart';
import 'package:fmlfantasy/core/imports/imports.dart';
import 'package:fmlfantasy/model/account_details_model.dart';
import 'package:fmlfantasy/model/transaction_model.dart';
import 'package:fmlfantasy/services/profile_service/profile_services.dart';

class StatementController extends GetxController {
  ProfileServices profileServices = ProfileServices();
  String token = '';
  RxList<AccountDetailsModel> accountDetailsList = <AccountDetailsModel>[].obs;

  RxInt displayedItems = 30.obs;

  RxList<TransactionModel> entryPaidList = <TransactionModel>[].obs;
  RxList<TransactionModel> winningList = <TransactionModel>[].obs;
  RxList<TransactionModel> depositList = <TransactionModel>[].obs;
  RxList<TransactionModel> withdrawList = <TransactionModel>[].obs;
  RxList<TransactionModel> prizeMoneyList = <TransactionModel>[].obs;

  final ScrollController scrollController = ScrollController();

  void _scrollListener() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      if (displayedItems.value < selectedData.length) {
        displayedItems.value += 30;
      }
    }
  }

  String _selectedButtonIndex = 'all';

  String get selectedButtonIndex => _selectedButtonIndex;

  set selectedButtonIndex(String value) {
    _selectedButtonIndex = value;
    update();
  }

  var selectedData = <TransactionModel>[].obs;
  RxList graphData = [].obs;
  String _selectedFilter = '7Days';
  String get selectedFilter => _selectedFilter;

  set selectedFilter(String value) {
    _selectedFilter = value;
    update();
  }

  RxString local = ''.obs;

  @override
  void onInit() async {
    accountDetailsList = Get.arguments['details'] ?? [];
    token = await getStringValuesSF();
    await getTransactions();
    filterGraphDateValue(selectedFilter);
    // await initializeGraphData();
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  RxList filterList = [].obs;
  void filterGraphDateValue(String range) {
    selectedFilter = range;
    if (graphData.isEmpty) {
      getTransactionsGraph(selectedFilter);
    }
    DateTime now = DateTime.now();
    List<Map<String, dynamic>> tempData = [];
    for (var entry in graphData) {
      DateTime entryDate = DateTime.parse(entry['date']);
      if (range == "1Day" && now.difference(entryDate).inDays <= 1) {
        tempData.add(entry);
      } else if (range == "7Days" && now.difference(entryDate).inDays <= 7) {
        tempData.add(entry);
      } else if (range == "1Month" && now.difference(entryDate).inDays <= 30) {
        tempData.add(entry);
      } else if (range == "3Months" && now.difference(entryDate).inDays <= 90) {
        tempData.add(entry);
      } else if (range == "1Year" && now.difference(entryDate).inDays <= 365) {
        tempData.add(entry);
      }
    }
    filterList.assignAll(tempData);
  }

  void loadData(String buttonIndex) {
    selectedButtonIndex = buttonIndex;
    switch (buttonIndex) {
      case '0':
        selectedData.value = entryPaidList.toList(); // No casting needed
        break;
      case '1':
        selectedData.value = winningList.toList();
        break;
      case '2':
        selectedData.value = depositList.toList();
        break;
      case '3':
        selectedData.value = withdrawList.toList();
        break;
      case '4':
        selectedData.value = prizeMoneyList.toList();
        break;
      case 'all':
        selectedData.value = [
          ...entryPaidList,
          ...winningList,
          ...depositList,
          ...withdrawList,
          ...prizeMoneyList
        ];
        break;
      default:
        break;
    }
  }

  Future<void> getTransactions() async {
    try {
      List<TransactionModel> data =
          await profileServices.fetchTransaction(token);
      entryPaidList.clear();
      winningList.clear();
      depositList.clear();
      withdrawList.clear();

      for (var transaction in data) {
        switch (transaction.transactionType) {
          case 'Entry fee':
            entryPaidList.add(transaction);
            break;
          case 'Winning':
            winningList.add(transaction);
            break;
          case 'Deposit':
            depositList.add(transaction);
            break;
          case 'Withdraw':
            withdrawList.add(transaction);
            break;
          case 'Prize money':
            prizeMoneyList.add(transaction);
            break;
          default:
            throw Exception(
                'Unknown transaction type: ${transaction.transactionType}');
        }
      }

      loadData(selectedButtonIndex);
    } catch (e) {
      throw Exception('Failed to fetch transactions');
    }
  }

  Future<void> getTransactionsGraph(var selected) async {
    try {
      graphData.value = await profileServices.fetchTransactionGraphData(token);
      selectedFilter = selected;
      filterGraphDateValue(selectedFilter);
    } catch (e) {
      throw Exception('Failed to fetch transactions');
      //  print("Error fetching profile: $e");
    }
  }
}
