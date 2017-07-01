//
//  main.m
//  2w1d5_paymentsAp
//
//  Created by Seantastic31 on 30/06/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaymentGateway.h"
#import "PaypalPaymentService.h"
#import "StripePaymentService.h"
#import "AmazonPaymentService.h"
#import "ApplePaymentService.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSInteger randomDollarValue = arc4random_uniform(900) + 100;
        
        NSLog(@"\nThank you for shopping at Acme.com\nYour total today is $%lu\nPlease select your payment method:\n1. Paypal, 2. Stripe, 3. Amazon 4. Apple\n", randomDollarValue);
        
        char str[100];
        fgets(str, 100, stdin);
        NSString *input = [[NSString alloc]initWithUTF8String:str];
        input = [input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSInteger choice = [input intValue];
        NSLog(@"Input was %lu", choice);
        
        PaymentGateway *paymentGateway = [[PaymentGateway alloc]init];
        // moved into each payment method in the switch
        //[paymentGateway processPaymentAmount:randomDollarValue];
        
        switch (choice) {
            case 1:
            {
                PaypalPaymentService *paypal = [[PaypalPaymentService alloc]init];
                paymentGateway.paymentDelegate = paypal;
                [paymentGateway processPaymentAmount:randomDollarValue];
                break;
            }
            case 2:
            {
                StripePaymentService *stripe = [[StripePaymentService alloc]init];
                paymentGateway.paymentDelegate = stripe;
                [paymentGateway processPaymentAmount:randomDollarValue];
                break;
            }
            case 3:
            {
                AmazonPaymentService *amazon = [[AmazonPaymentService alloc]init];
                paymentGateway.paymentDelegate = amazon;
                [paymentGateway processPaymentAmount:randomDollarValue];
                break;
            }
            case 4:
            {
                ApplePaymentService *apple = [[ApplePaymentService alloc]init];
                paymentGateway.paymentDelegate = apple;
                [paymentGateway processPaymentAmount:randomDollarValue];
                break;
            }
            default:
                NSLog(@"Invalid choice\n");
                break;
        }
        
        
        
        
    }
    return 0;
}
