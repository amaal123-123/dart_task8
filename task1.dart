enum PaymentType {
  cash,
  card,
  wallet
}


mixin Printable {
  void printPayment(double amount) {
    print("Payment Amount: $amount");
  }
}


abstract class Payment {
  double amount;

  static int paymentCount = 0;

  Payment(this.amount) {
    paymentCount++;
  }

  factory Payment.create(double amount, PaymentType type) {
    switch (type) {
      case PaymentType.cash:
        return CashPayment(amount);

      case PaymentType.card:
        return CardPayment(amount);

      case PaymentType.wallet:
        return WalletPayment(amount);
    }
  }

  void pay();
}

class CashPayment extends Payment with Printable {
  CashPayment(double amount) : super(amount);

  @override
  void pay() {
    print("Paid with Cash");
    printPayment(amount);
  }
}


class CardPayment extends Payment {
  CardPayment(double amount) : super(amount);

  @override
  void pay() {
    print("Paid with Card");
    print("Payment Amount: $amount");
  }
}

// Wallet Payment
class WalletPayment extends Payment {
  WalletPayment(double amount) : super(amount);

  @override
  void pay() {
    print("Paid with Wallet");
    print("Payment Amount: $amount");
  }
}
class PaymentBox<T> {
  T payment;

  PaymentBox(this.payment);
}

void main() {

  Payment cash = Payment.create(100, PaymentType.cash);
  Payment card = Payment.create(200, PaymentType.card);
  Payment wallet = Payment.create(300, PaymentType.wallet);

  PaymentBox<Payment> box = PaymentBox(cash);

  List<Payment> payments = [
    box.payment,
    card,
    wallet
  ];


  for (var payment in payments) {
    payment.pay();
  }
  
  print("Total Payments: ${Payment.paymentCount}");
}