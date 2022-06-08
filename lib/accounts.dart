import 'package:crm_admin/receiptList.dart';
import 'package:crm_admin/transactionList.dart';
import 'package:flutter/material.dart';
import 'addExpense.dart';
import 'addInvoice.dart';
import 'addTransaction.dart';
import 'dashboard.dart';
import 'debitCredit.dart';
import 'expenseList.dart';
import 'homePage.dart';
import 'httpService.dart';
import 'invoiceLis.dart';
import 'models/accountsModel.dart';
import 'pendingExpense.dart';

class Accounts extends StatefulWidget {

  String? token;
  String? menuId;
  int? selectedIndex;

  Accounts(this.token,this.menuId,this.selectedIndex);

  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  AccountsModel? accounts;

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    accounts = await HttpService.accounts(widget.token, widget.menuId);
    if (accounts != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) =>
                    HomePage(widget.token, 0)),
                (Route<dynamic> route) => false);
        return true;
      },
      child: Scaffold(

        body: accounts != null
            ? Container(
          width: double.infinity,
          height: size.height,

              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset("assets/images/top1.png",
                        width: size.width),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset("assets/images/top2.png",
                        width: size.width),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(widget.token, widget.selectedIndex)),
                                (Route<dynamic> route) => false);
                      },
                      child: Image.asset("assets/images/back_button.jpg",
                          width: 40),
                    ),
                  ),
                  SafeArea(
                      child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "Accounts",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: 1,
                                fontFamily: "Lobster"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              padding: EdgeInsets.zero,
                              itemCount: accounts!.data!.submenus!.length,
                              itemBuilder: (BuildContext context, index) {
                                return InkWell(
                                  onTap: () async {
                                    if (accounts!.data!.submenus![index].appPage ==
                                        'invoice_list') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => InvoiceList(widget.token,widget.menuId,'All',DateTime(DateTime.now().year, DateTime.now().month, 1).toString())),
                                      );
                                    }
                                    else if (accounts!.data!.submenus![index].appPage ==
                                        'add_invoice') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>AddInvoice(widget.token,widget.menuId)),
                                      );
                                    }
                                    else if (accounts!.data!.submenus![index].appPage ==
                                        'add_transction') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>TransactionList(widget.token,widget.menuId)),
                                      );
                                    }
                                    else if (accounts!.data!.submenus![index].appPage ==
                                        'pending_invoice') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>InvoiceList(widget.token,widget.menuId,'pending',DateTime(2022,1, 1).toString())),
                                      );
                                    }
                                    else if (accounts!.data!.submenus![index].appPage =='view_expense') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ExpenseList(widget.token,widget.menuId)),
                                      );
                                    }
                                    else if (accounts!.data!.submenus![index].appPage =='add_expense') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AddExpense(widget.token,widget.menuId)),
                                      );
                                    }
                                    else if (accounts!.data!.submenus![index].appPage =='view_receipt') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ReceiptList(widget.token,widget.menuId)),
                                      );
                                    }


                                    else if (accounts!.data!.submenus![index].appPage =='view_debit_credit') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DebitCredit(widget.token,null)),
                                      );
                                    }
                                    else if (accounts!.data!.submenus![index].appPage ==
                                        'NonFixedExpense') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>PendingExpense(widget.token,)),
                                      );
                                    }
                                  },
                                  child: GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                          maxHeight: 81,
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 0),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 5,
                                                        offset: Offset(1, 1)),
                                                  ],
                                                  color: Colors.white,

                                                  image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(accounts!.data!.submenus![index].subMenuIcon.toString())),
                                                  borderRadius: const BorderRadius.all(
                                                      Radius.circular(18))
                                              ),

                                              width: 70,
                                              height: 70,

                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Expanded(
                                              child: Text(
                                                accounts!.data!.submenus![index].submenuTitle
                                                    .toString(),
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
                ],
              ),
            )
            : AlertDialog(
                content: Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                    ),
                    Flexible(
                        flex: 8,
                        child: Text(
                          'Wait..',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
      ),
    );
  }
}
