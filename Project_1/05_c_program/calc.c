#include <stdio.h>

// Converts the US dollars to specified foreign currency.
void convertUStoForeign(int amount, int exchange) {
  int new_value = amount * exchange;
  printf(The value in Foreign Currency is : %d\n, new_value);
}

// Converts the Foreign Currency Amount to US Dollars.
void convertForeigntoUS(int amt, int exchange) {
  int new_value = amt/exchange;
  printf(The value in US Dollars is : %d\n, new_value);
}

int main(int argc, char **argv) {
  int amount = argv[1];
  int exchange_rate = argv[2];
  int conversion_type = argv[3];
  if (conversion_type == 1) {
    convertUStoForeign(amount, exchange_rate);
  } else if (conversion_type == 2) {
    convertForeigntoUS(amount, exchange_rate);
  } else {
    printf("Please include valid arguments");
  }
 
  return 0;
}
