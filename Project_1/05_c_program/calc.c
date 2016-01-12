#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void priceOfBeer(float exchange){
   float price = 2 * exchange;
   printf("The value of a bottle of beer in foreign currency is : %f\n", price);
}

// Converts the US dollars to specified foreign currency.
void convertUStoForeign(float amount, float exchange) {
  float new_value = amount * exchange;
  printf("The value in Foreign Currency is : %f\n" , new_value);
  priceOfBeer(exchange);
}

// Converts the Foreign Currency Amount to US Dollars.
void convertForeigntoUS(float amt, float exchange) {
  float new_value = amt/exchange;
  printf("The value in US Dollars is : %f\n", new_value);
}

int main(int argc, char **argv) {
  float amount = atof(argv[1]);
  float exchange_rate = atof(argv[2]);
  int conversion_type = atoi(argv[3]);
  if (conversion_type == 1) {
    convertUStoForeign(amount, exchange_rate);
  } else if (conversion_type == 2) {
    convertForeigntoUS(amount, exchange_rate);
  } else {
    printf("Please include valid arguments\n");
  }
 
  return 0;
}
